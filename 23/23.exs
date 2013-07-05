defmodule Euler23 do
  def divisors(0), do: [ 0 ]
  def divisors(n) when is_integer(n), do: _divisors(n, 1..(round(:math.sqrt(n))))

  defp _divisors(n, c) do
    Enum.filter(c, fn x -> rem(n, x) == 0 end)
    |> Enum.map(fn x -> [ x , div(n, x) ] end)
    |> Enum.reduce([], fn x,y -> x ++ y end)
    |> Enum.take(-1)
    |> Enum.uniq
  end

  def abundant?(n), do: Enum.reduce(divisors(n), 0, &1 + &2) > n

  def abundant_numbers(n), do: (lc x inlist Enum.to_list(1..n), abundant?(x), do: x)

  def sum_of?(collection, n), do: Enum.any?(collection, fn x -> Enum.member?(collection, n - x) end)
end

abundant = Euler23.abundant_numbers(28123)

(lc x inlist Enum.to_list(1..28123), !Euler23.sum_of?(abundant, x), do: x)
|> Enum.reduce(0, &1+&2)
|> IO.puts
