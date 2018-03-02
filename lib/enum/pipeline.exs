# ---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
# ---
# => [ 1, 2, 3, 4, 5 ]
# => [ 1, 4, 9, 16, 25 ]
# => [ {1, 0}, {4, 1}, {9, 2}, {16, 3}, {25, 4} ]
# => [1, 3, 7, 13, 21]
# => [1, 3, 7, 13, 21]
[1, 2, 3, 4, 5]
|> Enum.map(&(&1 * &1))
|> Enum.with_index()
|> Enum.map(fn {value, index} -> value - index end)
|> IO.inspect()
