defmodule Mm.ChopTest do
  use ExUnit.Case
  doctest Exbook

  import ExUnit.CaptureIO
  import Mm.Chop

  test "Basic game output" do
    assert capture_io(fn ->
             guess(273, 1..1000)
           end) ==
             "Is it 500?\nIs it 250?\nIs it 375?\nIs it 312?\nIs it 281?\nIs it 265?\nIs it 273?\n273\n"
  end
end
