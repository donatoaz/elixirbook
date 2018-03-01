defmodule MM.SumApTest do
  use ExUnit.Case
  doctest Exbook
  
  import Mm.SumAp

  test "sum of 0 is 0" do
    assert sum_ap(0) == 0
  end
  
  test "sum of 1 is one" do
    assert sum_ap(1) == 1
  end
  
  test "sum of 10" do
    assert sum_ap(10) == 55
  end
end
