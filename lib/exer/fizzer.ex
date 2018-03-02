defmodule Exer.Fizzer do
  def fizzer(0, 0, _), do: "FizzBuzz"
  def fizzer(0, _, _), do: "Fizz"
  def fizzer(_, 0, _), do: "Buzz"
  def fizzer(_, _, n), do: n
end

# command+option+arrow = duplicates line
# option+arrow = moves line
# ctrl+option+arrow increases the carret
# ctrl+option+arrow followed by shift+arrows = select vertically

# fizz_runner = fn n -> fizzer.(rem(n,3), rem(n,5), n) end

# Enum.map 10..16, fn x -> IO.puts fizz_runner.(x) end
