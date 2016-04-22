defmodule Counter do
  def loop(count \\ 0) do
    receive do
      {:increment} -> loop(count + 1)
      {:decrement} -> loop(count - 1)
      {:reset} -> loop
      {:status, pid} -> send(pid, {:result, count})
      loop(count)
    end
  end
end
