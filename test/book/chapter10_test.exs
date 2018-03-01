defmodule Book.Chapter10Test do
    use ExUnit.Case, async: false
    use ExCheck
    import ExUnit.CaptureIO
    alias Book.Chapter10

    test "test all simple case, true" do
        assert Chapter10.all?([1,2,3], &(&1 < 5)) == true
    end

    test "test all simple case, false" do
        assert Chapter10.all?([1,2,3], &(&1 < 2)) == false
    end

    test "each function simple test" do
        assert capture_io( fn ->
            Chapter10.each([1,2,3], fn i -> IO.puts i*i end)
        end ) == "1\n4\n9\n"
    end

    test "filter function simple test" do
        assert Chapter10.filter([1,2,3,4,5,6], &(&1 <= 3)) == Enum.filter([1,2,3,4,5,6], &(&1 <= 3))
    end

    @tag :skip
    test "split function simple test case" do
        assert Chapter10.split([1, 2, 3], 2) == Enum.split([1, 2, 3], 2)
        # {[1, 2], [3]}

        assert Chapter10.split([1, 2, 3], 10) == Enum.split([1, 2, 3], 10)
        # {[1, 2, 3], []}

        assert Chapter10.split([1, 2, 3], 0) == Enum.split([1, 2, 3], 0)
        # {[], [1, 2, 3]}

        assert Chapter10.split([1, 2, 3], -1) == Enum.split([1, 2, 3], -1)
        # {[1, 2], [3]}

        assert Chapter10.split([1, 2, 3], -5) == Enum.split([1, 2, 3], -5)
        # {[], [1, 2, 3]}
    end

    @tag :skip
    test "take function simple test" do
        assert Chapter10.take([1, 2, 3], 2) == Enum.take([1, 2, 3], 2)
        # [1, 2]

        assert Chapter10.take([1, 2, 3], 10) == Enum.take([1, 2, 3], 10)
        # [1, 2, 3]

        assert Chapter10.take([1, 2, 3], 0) == Enum.take([1, 2, 3], 0)
        # []

        assert Chapter10.take([1, 2, 3], -1) == Enum.take([1, 2, 3], -1)
        # [3]
    end

end