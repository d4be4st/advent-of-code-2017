defmodule Task6 do
  def run(memory) do
    cycle([], memory)
  end

  def cycle(previous, current) do
    if Enum.member?(previous, Map.values(current)) do
      first = Enum.find_index(previous, fn(x) -> x == Map.values(current) end)
      IO.puts length(previous) - first
    else
      previous = previous ++ [Map.values(current)]

      {index, max} = Enum.max_by(current, fn {index, value} -> value end)

      IO.inspect {current, max, index}
      current = Map.put(current, index, 0)

      current = add_one(current, max, rem(index + 1, Map.size(current)))
      cycle(previous, current)
    end
  end

  def add_one(current, 0, index), do: current

  def add_one(current, max, index) do
    current = Map.update!(current, index, fn(v) -> v + 1 end)
    current = add_one(current, max - 1, rem(index + 1, Map.size(current)))
    current
  end
end

input = [4,10,4,1,8,4,9,14,5,1,14,15,0,15,3,5]
# input = [0,2,7,0]

memory =
  input
  |> Stream.with_index
  |> Stream.map(fn {value, index} -> {index, value} end)
  |> Map.new()

Task6.run(memory)



