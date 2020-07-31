defmodule TeacherWeb.PasswordResetController do
  use TeacherWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
