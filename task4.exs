IO.inspect(
  File.stream!("input4.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(fn(line) ->
    array = String.split(line, " ")
    sorted = Enum.map(array, fn(string) -> String.graphemes(string) |> Enum.sort |> Enum.join end)
    length(array) == length(Enum.uniq(sorted))
  end)
  |> Enum.count(fn(x) -> x end)
)
