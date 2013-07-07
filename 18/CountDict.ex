defmodule CountDict do
@doc  """

      ### Examples
      iex>CountDict.new [5,4,3,2,1], fn c,v -> {c, v} end
      iex>#HashDict<[{0,5},{1,4},{2,3},{3,2},{4,1}]>
      """
  def new(list, transform // fn x -> x end) do
    _new(list, transform, [], 0)
  end

  defp _new([], _, acc, _) do
    acc |> Enum.reverse |> HashDict.new
  end

  defp _new([ h | t ], transform, acc, count) do
    _new(t, transform, [transform.(count, h) | acc ], count + 1)
  end
end
