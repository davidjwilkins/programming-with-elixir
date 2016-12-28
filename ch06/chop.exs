defmodule Chop do
  def guess(val, min..max) do
    IO.puts "Is it #{div(min+max,2)}"
    check(val, div(min+max,2), min, max)
  end

  defp check(val, val, _, _) do
    IO.puts val
  end

  defp check(val, mid, _, max) when val > mid do
    IO.puts "more"
    guess(val, mid..max)
  end
  defp check(val, mid, min, _) when val < mid do
    IO.puts "less"
    guess(val, min..mid)
  end
end

