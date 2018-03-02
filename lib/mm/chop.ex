defmodule Mm.Chop do
  def guess(actual, low..high) when actual == div(low + high, 2) do
    print_guess(div(low + high, 2))
    IO.puts(div(low + high, 2))
  end

  def guess(actual, low..high) when actual < div(low + high, 2) do
    print_guess(div(low + high, 2))
    guess(actual, low..div(low + high, 2))
  end

  def guess(actual, low..high) when actual > div(low + high, 2) do
    print_guess(div(low + high, 2))
    guess(actual, div(low + high, 2)..high)
  end

  defp print_guess(x), do: IO.puts("Is it #{x}?")
end
