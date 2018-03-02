defmodule Book.Chapter10Test do
  use ExUnit.Case, async: false
  use ExCheck
  import ExUnit.CaptureIO

  alias Book.Chapter10
  alias Book.Chapter7

  test "test all simple case, true" do
    assert Chapter10.all?([1, 2, 3], &(&1 < 5)) == true
  end

  test "test all simple case, false" do
    assert Chapter10.all?([1, 2, 3], &(&1 < 2)) == false
  end

  test "each function simple test" do
    assert capture_io(fn ->
             Chapter10.each([1, 2, 3], fn i -> IO.puts(i * i) end)
           end) == "1\n4\n9\n"
  end

  test "filter function simple test" do
    assert Chapter10.filter([1, 2, 3, 4, 5, 6], &(&1 <= 3)) ==
             Enum.filter([1, 2, 3, 4, 5, 6], &(&1 <= 3))
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

  test "test comprehensions prime numbers" do
    my_span = Chapter7.span(2, 10)
    my_primes = for x <- my_span, Chapter10.is_prime(x), do: x
    assert my_primes == [2, 3, 5, 7]
  end

  test "tax charging" do
    tax_rates = [NC: 0.075, TX: 0.08]

    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00]
    ]

    valid_taxed_orders = [
      [total_amount: 107.50, id: 123, ship_to: :NC, net_amount: 100.00],
      [total_amount: 35.50, id: 124, ship_to: :OK, net_amount: 35.50],
      [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.00]
    ]

    taxed_orders =
      orders
      |> Chapter10.apply_tax(tax_rates)

    assert taxed_orders == valid_taxed_orders
  end
end
