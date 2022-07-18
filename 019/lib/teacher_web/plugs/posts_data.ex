defmodule TeacherWeb.PostsDataPlug do
  import Plug.Conn

  alias Teacher.Posts

  def post_count(conn, _opts) do
    assign(conn, :post_count, Posts.count_posts())
  end
end
