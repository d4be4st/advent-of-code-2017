defmodule Task1 do
  def reduce(array, offset) do
    array
    |> Enum.with_index
    |> Enum.reduce(0, fn({el, index}, acc)->
      if el == Enum.at(array, rem(index + offset, length(array))) do
        acc + String.to_integer(el)
      else
        acc
      end
    end)
  end
end

{:ok, string} = File.read("input1.txt")
array = String.graphemes(String.trim(string))

sum1 = Task1.reduce(array, 1)
sum2 = Task1.reduce(array, trunc(length(array) / 2))

IO.puts sum1
IO.puts sum2
