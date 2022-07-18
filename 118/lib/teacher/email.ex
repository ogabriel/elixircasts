defmodule Teacher.Email do
  use Bamboo.Phoenix, view: TeacherWeb.EmailView

  def base_email(user) do
    new_email
    |> from("no-reply@teachers.com")
    |> to(user.username)
  end

  def password_reset(user) do
    base_email(user)
    |> subject("Password reset")
    |> assign(:user, user)
    |> put_html_layout({TeacherWeb.LayoutView, "email.html"})
    |> render("password_reset.html")
  end
end
