defmodule Book.Chapter11 do
  def is_ascii?(list) do
    Enum.all?(list, &(&1 > 32 && &1 < 126))
  end

  def anagram?(list1, list2) do
    list1 |> Enum.sort() |> Enum.uniq() == list2 |> Enum.sort() |> Enum.uniq()
  end

  def center(list), do: centerize(list)

  def centerize(list) do
    max =
      list
      |> Enum.map(&String.length(&1))
      |> Enum.max()

    list
    |> Enum.map(fn x ->
      String.pad_leading(x, Enum.min([String.length(x) + div(max - String.length(x), 2), max]))
    end)
    |> Enum.map(fn x -> String.pad_trailing(x, max) end)
  end
end
