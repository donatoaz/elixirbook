defmodule Exer.FizzerTest do
  use ExUnit.Case
  doctest Exbook
  
  import Exer.Fizzer
  
  test "when first and second args are zero, return fizzbuzz" do
    assert fizzer(0, 0, 1) == "FizzBuzz"
  end
  
  test "when first arg is zero, return fizz" do
    assert fizzer(0, 1, 1) == "Fizz"
  end
  
  test "when second arg is zero return buzz" do
    assert fizzer(1, 0, 1) == "Buzz"
  end
  
  test "general case" do
    assert fizzer(1, 1, 2) == 2
  end
  
  test "fizz_runner from 10 to 16" do
    fizz_runner = fn n -> fizzer(rem(n,3), rem(n,5), n) end
    result = Enum.map 10..16, fn x -> fizz_runner.(x) end
    assert result == ["Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16]
  end
  
end
