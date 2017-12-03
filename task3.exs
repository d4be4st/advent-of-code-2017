defmodule Task3 do
  @directions [:right, :up, :left, :down]

  def spiral(end_number) do
    hash = %{{0, 0} => 1}
    hash = add(hash, 1, {1, 0}, {1, 1, 1, 0}, end_number)
    hash
  end

  def add(hash, number, position, _, end_number) when number > end_number do
    hash = Map.put(hash, position, number)
    IO.inspect(%{position => number})
    hash
  end

  def add(hash, number, position, {step, step, 1, direction}, end_number) do
    # IO.inspect {position, number}
    hash = Map.put(hash, position, number)
    new_direction = rem(direction + 1, 4)
    next_position = next_position(position, Enum.at(@directions, new_direction))
    hash = add(hash, new_number(hash, next_position), next_position, {step, 1, 2, new_direction}, end_number)
    hash
  end

  def add(hash, number, position, {step, step, 2, direction}, end_number) do
    # IO.inspect {position, number}
    hash = Map.put(hash, position, number)
    new_direction = rem(direction + 1, 4)
    next_position = next_position(position, Enum.at(@directions, new_direction))
    hash = add(hash, new_number(hash, next_position), next_position, {step + 1, 1, 1, new_direction}, end_number)
    hash
  end

  def add(hash, number, position, {step, current_step, times, direction}, end_number) do
    # IO.inspect {position, number}
    hash = Map.put(hash, position, number)
    next_position = next_position(position, Enum.at(@directions, direction))
    hash = add(hash, new_number(hash, next_position), next_position, {step, current_step + 1, times, direction}, end_number)
    hash
  end

  def next_position({x, y}, :right), do: {x + 1, y}
  def next_position({x, y}, :left), do: {x - 1, y}
  def next_position({x, y}, :down), do: {x, y - 1}
  def next_position({x, y}, :up), do: {x, y + 1}


  def new_number(hash, {x, y}) do
    array =
      [
        hash[{x - 1, y - 1}], hash[{x, y - 1}], hash[{x + 1, y - 1}],
        hash[{x - 1, y}], hash[{x, y}], hash[{x + 1, y}],
        hash[{x - 1, y + 1}], hash[{x, y + 1}], hash[{x + 1, y + 1}]
      ]
    # IO.inspect array
    array |> Enum.filter(fn(x) -> x != nil end) |> Enum.sum
  end
end
