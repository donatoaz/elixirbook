defmodule Book.Chapter11 do

  def is_ascii?(list) do
    Enum.all?(list, &( &1 > 32  && &1 < 126 ))
  end

  def anagram?(list1, list2) do
    list1 |> Enum.sort |> Enum.uniq
    ==
    list2 |> Enum.sort |> Enum.uniq
  end
end