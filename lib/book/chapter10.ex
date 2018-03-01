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
end