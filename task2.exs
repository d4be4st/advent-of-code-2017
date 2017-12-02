{:ok, string} = File.read("input2.txt")
array = String.split(String.trim(string), "\n")
array = Enum.map(array, fn(x) -> String.split(x, "\t") end)

sum1 =
  Enum.reduce(array, 0, fn(line, acc) ->
    max = String.to_integer(Enum.max_by(line, &String.to_integer/1))
    min = String.to_integer(Enum.min_by(line, &String.to_integer/1))
    acc + max - min
  end)

sum2 =
  Enum.reduce(array, 0, fn(line, acc) ->
    list_comb =
      Enum.flat_map line, fn(x) ->
        sub = List.delete(line, x)
        Enum.map(sub, fn(y) ->
          {String.to_integer(x), String.to_integer(y)}
        end)
      end

    {a, b} =
      Enum.find(list_comb, fn({a, b}) ->
        rem(a, b) == 0
      end)
    acc + a / b
  end)

IO.puts(sum1)
IO.puts(sum2)
