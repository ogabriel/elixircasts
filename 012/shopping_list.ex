defmodule ShoppingList do
  use GenServer

  # client
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def add(pid, item) do
    GenServer.cast(pid, item)
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  def remove(pid, item) do
    GenServer.cast(pid, {:remove, item})
  end

  def stop(pid) do
    GenServer.stop(pid, :normal, :infinity)
  end

  # server

  def terminate(_reason, list) do
    IO.puts("Finished")
    IO.inspect(list)
    :ok
  end

  def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, &(&1 == item))
    {:noreply, updated_list}
  end

  def handle_cast(item, list) do
    update_list = [item | list]
    {:noreply, update_list}
  end

  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end

  def init(list) do
    {:ok, list}
  end
end
