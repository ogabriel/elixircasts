let Chat = {
  init(socket) {
    let path = window.location.pathname.split('/')
    let room = path[path.lenght - 1]
    let channel = socket.channel('chat: ' + room, {})

    channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
  }
}

export default Chat
