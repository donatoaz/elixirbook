# multiple definitions of the same function are in fact multiple clauser of the 
#  same definition
defmodule Mm.Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end
