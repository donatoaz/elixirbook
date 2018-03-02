defmodule Book.Chapter10 do
  def all?([last], check), do: check.(last)

  def all?([head | tail], check) do
    check.(head) && all?(tail, check)
  end

  def each([], _func) do
  end

  def each([last], func), do: func.(last)

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: List.flatten([])

  def filter([head | tail], func) do
    if func.(head) do
      List.flatten([head | filter(tail, func)])
    else
      List.flatten([filter(tail, func)])
    end
  end

  # TODO:
  # def split(list, count), do: _split(list, count, 0)
  # def _split([], count, _), do: {[], []}
  # def _split([head | tail], count, kept)

  # TODO:
  # def take([], _count), do: []
  # def take([head | tail], count) when taken < count, do: [head | take(tail, count, taken+1)]
  # def take([head | tail], count, taken), do: [head | take(tail, count, taken+1)]

  # Exercise:ListsAndRecursion-7
  def is_prime(n) when n <= 1, do: false
  def is_prime(n) when n in [2, 3], do: true

  def is_prime(n) do
    int_sqrt =
      :math.sqrt(n)
      |> Float.floor()
      |> round

    !Enum.any?(2..int_sqrt, &(rem(n, &1) == 0))
  end

  def apply_tax(orders, tax_rates) do
    for ord <- orders do
      Keyword.put(ord, :total_amount, tax_for(ord, tax_rates))
    end
  end

  def tax_for(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    net * (1 + Keyword.get(tax_rates, state, 0))
  end
end
