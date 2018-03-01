defmodule Book.Chapter10Test do
  use ExUnit.Case, async: false
  use ExCheck
  import ExUnit.CaptureIO

  alias Book.Chapter11

  test "is all ascii function true case" do
    assert Chapter11.is_ascii?('abc')
  end

  test "is all ascii function false case" do
    refute Chapter11.is_ascii?([180,99,97,92])
  end

  test "anagram function simple true case" do
    assert Chapter11.anagram?('cat', 'tac')
  end

  test "anagram function simple false case" do
    refute Chapter11.anagram?('cat', 'gac')
  end
end