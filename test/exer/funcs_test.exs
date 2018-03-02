defmodule Exer.FuncsTest do
  use ExUnit.Case
  doctest Exbook

  import Exer.Funcs

  test "concatenates two lists" do
    assert list_concat([1, 2], [3, 4]) == [1, 2, 3, 4]
  end

  test "sum simple" do
    assert sum_simple(3, 4, 5) == 12
  end

  test "pair tuple to list" do
    assert pair_tuple_to_list({3, 4}) == [3, 4]
  end

  test "sum simple other" do
    assert sum_simple(1, 2, 3) == 6
  end
end
