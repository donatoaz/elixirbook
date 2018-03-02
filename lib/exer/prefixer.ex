defmodule Exer.Prefixer do
  def prefix(string) do
    fn second_string -> "#{string} #{second_string}" end
  end
end
