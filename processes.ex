defmodule Test do
  def loop do
    receive do
      {:ok, msg} -> IO.puts "I got this message, friend: #{msg}"
      anything ->
        IO.puts "I cannot respond to this type of message"
        IO.inspect anything
    end
    loop
  end
end
