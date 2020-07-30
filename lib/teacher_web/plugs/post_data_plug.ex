defmodule TeacherWeb.PostDataPlug do
  import Plug.Conn

  alias Teacher.Posts

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    assign(conn, :post_count, Posts.count_posts())
  end
end
