defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/posts")
  end
end
