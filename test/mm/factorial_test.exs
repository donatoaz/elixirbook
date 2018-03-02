defmodule MM.FactorialTest do
  use ExUnit.Case
  doctest Exbook

  import Mm.Factorial

  test "factorial of zero is one" do
    assert of(0) == 1
  end

  test "factorial of 1 is one" do
    assert of(1) == 1
  end

  test "factorial of 10 is 3628800" do
    assert of(10) == 3_628_800
  end
end
