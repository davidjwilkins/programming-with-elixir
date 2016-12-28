defmodule MyList do
  def sum([head | []]), do: head
  def sum([head | tail]), do: head + sum(tail)

  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def map([head | []], func) do
    [func.(head)]
  end
  def map([head | tail], func) do
    [func.(head)] ++ map(tail, func)
  end

  def mapsum([head | tail], func) do
    map([head | tail], func)
    |> sum
  end

  def max([head | tail]) do
    _max(head, tail)
  end
  defp _max(carry, [head | []]) when head > carry, do: head
  defp _max(carry, [head | []]) when head <= carry, do: carry
  defp _max(carry, [head | tail]) when head > carry do
    _max(head, tail)
  end
  defp _max(carry, [head | tail]) when head <= carry do
    _max(carry, tail)
  end

  def caesar(str, num) do
    map(str, &(&1 + num))
    |> map(fn
      (str) when str > 122 -> str - 58
      (str) -> str
    end)
  end
end
