defmodule Book.Chapter7 do
    def my_sum([accum | [head | tail]]) do
        my_sum([accum + head | tail])
    end
    
    def my_sum([accum | []]), do: accum
    def my_sum([]), do: 0
    
    # mapsum function
    def mapsum(list, fun, accum \\ 0)
    def mapsum([head | tail], fun, accum) do
        mapsum(tail, fun, fun.(head) + accum)
    end
    def mapsum([], _fun, accum), do: accum
    
    # the default parameter is a hack to represent minus infinity,
    #  because it will always be smaller than any integer
    def my_max(list, negative_infinity \\ {})
    def my_max([head | tail], current_max) when {head} > current_max, do: my_max(tail, {head})
    def my_max([head | tail], current_max) when {head} <= current_max, do: my_max(tail, current_max)
    def my_max([], current_max), do: elem(current_max,0)
    
    # TODO:
    def caesar(list, n) do
        Enum.map list, &(&1+n)
    end
    
    def span(from, to) when from == to, do: [from]
    def span(from, to) when from < to, do: [from | span(from+1, to)]
    def span(from, to), do: [from | span(from-1, to)]
end
