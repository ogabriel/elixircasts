defmodule TeacherWeb.CommentController do
  use TeacherWeb, :controller

  alias Teacher.Posts

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    post = Posts.get_post!(post_id)

    case Posts.create_post_comment(post, comment_params["body"]) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
