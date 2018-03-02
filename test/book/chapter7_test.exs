defmodule Book.Chapter7Test do
  use ExUnit.Case, async: false

  use ExCheck

  import Book.Chapter7

  test "test simple case" do
    assert my_sum([1, 1, 1]) == 3
  end

  test "edge case empty list" do
    assert my_sum([]) == 0
  end

  test "edge case list with 1 element" do
    assert my_sum([10]) == 10
  end

  test "edge case list with 2 elements" do
    assert my_sum([1, 2]) == 3
  end

  test "compare with stl function" do
    assert Enum.sum([13, 18, 20]) == my_sum([13, 18, 20])
  end

  # @tag :skip
  property :comparison do
    for_all x in list(int()) do
      Enum.sum(x) == my_sum(x)
    end
  end

  test "simple mapsum function" do
    assert mapsum([1, 2, 3], &(&1 * &1)) == 14
  end

  test "simple max function" do
    assert Enum.max([1, 5, 20, -50]) == my_max([1, 5, 20, -50])
  end

  test "span function ascending" do
    assert span(1, 5) == [1, 2, 3, 4, 5]
  end

  test "span function descending" do
    assert span(5, 1) == Enum.reverse([1, 2, 3, 4, 5])
  end

  test "edge case equal numbers" do
    assert span(2, 2) == [2]
  end

  test "negative numbers" do
    assert span(-10, -5) == Enum.to_list(-10..-5)
  end

  property :span_multi_cases do
    for_all {x, y} in {int(), int()} do
      assert span(x, y) == Enum.to_list(x..y)
    end
  end
end
