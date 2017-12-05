defmodule Task5 do
  def run(maze) do
    step(maze, 0, 0)
  end

  def step(maze, index, count) do
    if(index < 0 || index >= Map.size(maze)) do
      IO.puts count
    else
      step = maze[index]
      # maze = Map.put(maze, index, step + 1)
      maze =
        if step >= 3 do
          Map.put(maze, index, step - 1)
        else
          Map.put(maze, index, step + 1)
        end
      step(maze, index + step, count + 1)
    end
  end
end

{:ok, string} = File.read("input5.txt")
maze =
  string
  |> String.trim
  |> String.split("\n")
  |> Enum.map(&String.to_integer/1)
  |> Stream.with_index
  |> Stream.map(fn {instruction, index} -> {index, instruction} end)
  |> Map.new()

# maze = [0, 3, 0, 1, -3]
Task5.run(maze)
