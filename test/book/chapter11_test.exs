defmodule Book.Chapter11Test do
  use ExUnit.Case, async: false
  use ExCheck
  import ExUnit.CaptureIO

  alias Book.Chapter11

  test "is all ascii function true case" do
    assert Chapter11.is_ascii?('abc')
  end

  test "is all ascii function false case" do
    refute Chapter11.is_ascii?([180, 99, 97, 92])
  end

  test "anagram function simple true case" do
    assert Chapter11.anagram?('cat', 'tac')
  end

  test "anagram function simple false case" do
    refute Chapter11.anagram?('cat', 'gac')
  end

  test "center function normal case" do
    assert Chapter11.center(["cat", "zebra", "elephant"]) == [
             "  cat   ",
             " zebra  ",
             "elephant"
           ]
  end

  test "More complicated case?" do
    assert Chapter11.center(["c", "superlongstring", "lorenipsumlorenipsumlorenipsum"]) == [
             "              c               ",
             "       superlongstring        ",
             "lorenipsumlorenipsumlorenipsum"
           ]
  end

  test "testando formatter" do
    assert 1 == 1
  end
end
