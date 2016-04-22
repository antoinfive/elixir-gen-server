defmodule GenCounter do
  use GenServer

  def start_link(GenIncrement, [], name: __MODULE__)
    {:ok, pid} = GenServer.start_link(GenIncrement, [])
    Process.register(pid, __MODULE__)
    {:ok, pid}
  end
  def handle_cast({:increment}, total)
    {:noreply, total + 1}
  end

  def handle_cast({:decrement}, total)
    {:noreply, total - 1}
  end

  def handle_cast({:reset}, _total)
    {:noreply, 0}
  end

  def handle_call({:status}, _pid, total)
    {:reply, total, total}
  end
end
