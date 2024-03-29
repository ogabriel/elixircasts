defmodule TeacherWeb.SessionController do
  use TeacherWeb, :controller
  alias Teacher.Accouts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accouts.get_user_by_username(auth_params["username"])

    case Bcrypt.check_pass(user, auth_params["password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: Routes.post_path(conn, :index))

      _ ->
        conn
        |> put_flash(:error, "Wrong password or username")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
