# ---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
# ---
defmodule Countdown do
  def sleep(seconds) do
    receive do
    after
      seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn(fn -> :os.cmd('echo #{text}') end)
  end

  def timer do
    Stream.resource(
      # the number of seconds to the start of the next minute
      fn ->
        {_h, _m, s} = :erlang.time()
        60 - s - 1
      end,
      # wait for the next second, then return its countdown
      fn
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          {[inspect(count)], count - 1}
      end,
      # nothing to deallocate
      fn _ -> nil end
    )
  end
end
