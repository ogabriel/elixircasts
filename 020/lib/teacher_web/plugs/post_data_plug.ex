defmodule TeacherWeb.PostDataPlug do
  import Plug.Conn

  alias Teacher.Posts

  def init(opts) do
    Keyword.fetch(opts, :msg)
  end

  def call(conn, opts) do
    msg =
      case opts do
        {:ok, msg} ->
          "#{msg} #{Posts.count_posts()}."

        :error ->
          "We found #{Posts.count_posts()} posts."
      end

    assign(conn, :post_count, msg)
  end
end
