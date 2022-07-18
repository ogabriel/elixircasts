defmodule ChatWeb.ChatController do
  use ChatWeb, :controller

  alias Chat.Chats

  def show(conn, %{"id" => room}) do
    messages = Chats.list_messages_by_room(room)

    render(conn, "show.html", room: room, messages: messages)
  end
end
