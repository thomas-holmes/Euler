#naive elixir solution

defmodule Euler18 do
  def get_longest_path(file_name) do
    file_name
    |> get_triangle
    |> compute_longest_path # brute force method
    |> print_output
  end

  def get_triangle(file) do
    file
    |> read_file
    |> parse_file
  end

  def compute_longest_path(triangle) do
    value = Enum.at(triangle, 0) |> Enum.at 0
    _longest_path(triangle, value, {0, 0}, [value])
  end

  defp _longest_path(triangle, acc, pos, route) when elem(pos,0) == (length(triangle) - 1) do
    {acc, Enum.reverse route}
  end

  defp _longest_path(triangle, acc, pos, route) do
    next_pos = next_row(pos)
    left = triangle |> Enum.at(elem next_pos, 0) |> Enum.at(elem next_pos, 1)
    right = triangle |> Enum.at(elem next_pos, 0) |> Enum.at(elem(pos, 1) + 1)
    Enum.max([
      _longest_path(triangle, acc + left, next_pos, [left | route]),
      _longest_path(triangle, acc + right, next_pos |> next_col, [right | route])
    ], fn x-> elem(x, 0) end)
  end

  defp next_row(pos) do
    pos |> set_elem(0, elem(pos, 0) + 1)
  end

  defp next_col(pos) do
    pos |> set_elem(1, elem(pos, 1) + 1)
  end

  def read_file(name) do
    {:ok, file} = File.open(name)
    _read_file(file, nil, [])
  end

  defp _read_file(_, :eof, list), do: Enum.reverse list

  defp _read_file(file, nil, list), do: _read_file(file, IO.readline(file), list)

  defp _read_file(file, line, list) do
    _read_file(file, IO.readline(file), [ line | list ])
  end

  defp print_output(out), do: IO.puts inspect out

  def parse_file(list) do
    Enum.map(list, fn x -> Enum.map(String.split(x), binary_to_integer(&1)) end)
  end
end

defmodule Euler18b do
  def get_longest_path(file) do
    file
    |> get_triangle
    |> compute_longest_path
  end

  def get_triangle(file) do
    file
    |> read_file
    |> parse_file
  end

  def compute_longest_path(triangle) do
    triangle
  end

  def read_file(name) do
    {:ok, file} = File.read(name)
    file
  end

  def parse_file(output) do
    output
    |> String.split("\n")
    |> Enum.take(-1)
    |> Enum.map(fn x -> Enum.map(String.split(x), binary_to_integer(&1)) end)
    |> Enum.map(fn x -> CountDict.new(x, fn c, y -> {c, y} end) end)
    |> CountDict.new(fn c, y -> {c, y} end)
  end
end
