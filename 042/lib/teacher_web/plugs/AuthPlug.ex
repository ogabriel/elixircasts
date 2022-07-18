defmodule TeacherWeb.AuthPlug do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  alias Teacher.Accouts
  alias TeacherWeb.Router.Helpers, as: Routes

  def init(opts) do
    Keyword.fetch(opts, :msg)
  end

  def call(conn, opts) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Accouts.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      msg =
        case opts do
          {:ok, msg} -> msg
          _ -> "You need to be signed in to access this page"
        end

      conn
      |> put_flash(:error, msg)
      |> redirect(to: Routes.post_path(conn, :index))
      |> halt
    end
  end
end
