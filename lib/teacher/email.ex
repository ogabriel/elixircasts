defmodule Teacher.Email do
  use Bamboo.Phoenix, view: Teacher.EmailView

  def post_removal_email(post) do
    base_email
    |> subject("A post was removed")
    |> assign(:post, post)
    |> render("post_removal.html")
  end

  def post_creation_email(post) do
    base_email
    |> subject("A post was created")
    |> assign(:post, post)
    |> render("post_creation.html")
  end

  defp base_email do
    new_email
    |> from("no-reply@elixircasts.io")
    |> to("hello@elixircasts.io")
    |> put_html_layout({TeacherWeb.LayoutView, "email.html"})
  end
end
