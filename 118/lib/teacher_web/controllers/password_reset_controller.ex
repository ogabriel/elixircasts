defmodule TeacherWeb.PasswordResetController do
  use TeacherWeb, :controller

  alias Teacher.{Accouts, Email, Mailer}

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"email" => email}) do
    case Accouts.get_user_by_username(email) do
      nil ->
        conn
        |> put_flash(:error, "This email does not exist")
        |> redirect(to: Routes.password_reset_path(conn, :new))

      user ->
        user
        |> Accouts.set_token_on_user()
        |> Email.password_reset()
        |> Mailer.deliver_later()

        conn
        |> put_flash(:info, "Email sent with password reset instructions")
        |> redirect(to: Routes.session_path(conn, :new))
    end
  end

  def edit(conn, %{"id" => token}) do
    if user = Accouts.get_user_from_token(token) do
      changeset = Accouts.change_user(user)
      render(conn, "edit.html", user: user, changeset: changeset)
    else
      render(conn, "invalid_token.html")
    end
  end

  def update(conn, %{"id" => token, "user" => attrs}) do
    user = Accouts.get_user_from_token(token)

    with true <- Accouts.valid_token?(user.password_reset_sent_at),
         attrs <-
           Map.merge(attrs, %{"password_reset_token" => nil, "password_reset_sent_at" => nil}),
         {:ok, _user} <- Accouts.update_user(user, attrs) do
      conn
      |> put_flash(:info, "Your password has been reseted")
      |> redirect(to: Routes.session_path(conn, :new))
    else
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Error changing password")
        |> render("edit.html", user: user, changeset: changeset)

      false ->
        conn
        |> put_flash(:error, "Token expired")
        |> redirect(to: Routes.password_reset_path(conn, :new))
    end
  end
end
