defmodule Mm.SumAp do
    def sum_ap(0), do: 0
    def sum_ap(n), do: n + sum_ap(n-1)
end