defmodule Mm.Gcd do
  def gcd(x, 0) when x >= 0, do: x
  def gcd(0, x) when x >= 0, do: x
  def gcd(x, y) when x >= 0 and y >= 0, do: gcd(y, rem(x, y))

  def gcd(x, y) when x < 0 or y < 0,
    do: raise(message: "Negative numbers do not have gcds duude...")
end
