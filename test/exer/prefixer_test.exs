defmodule Exer.PrefixerTest do
  use ExUnit.Case
  doctest Exbook

  import Exer.Prefixer

  test "basic greeting" do
    mrs_smith = prefix("Mrs")
    assert mrs_smith.("Smith") == "Mrs Smith"
  end

  test "elixir rocks" do
    assert prefix("Elixir").("Rocks") == "Elixir Rocks"
  end
end
