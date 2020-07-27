defmodule ChatWeb.WaterCoolerChannel do
  use ChatWeb, :channel

  @impl true
  def join("water_cooler:lobby", payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (water_cooler:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
