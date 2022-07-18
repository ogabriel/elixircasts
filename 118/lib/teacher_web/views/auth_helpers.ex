defmodule TeacherWeb.AuthHelpers do
  alias Teacher.Accouts

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)

    if user_id, do: !!Accouts.get_user!(user_id)
  end
end
