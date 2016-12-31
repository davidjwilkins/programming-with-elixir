defmodule MyEnum do
  def all?([head | []], func) do
    func.(head)
  end

  def all?([head | tail], func) do
    func.(head) and all? tail, func
  end

  def each([head | []], func) do
    [func.(head)]
  end

  def each([head | tail], func) do
    [func.(head)] ++ each(tail, func)
  end

  def filter([head | []], func) do
    if func.(head) do
      [head]
    else
      []
    end
  end

  def filter([head | tail], func) do
    if func.(head) do
      [head] ++ filter(tail, func)
    else
      filter(tail, func)
    end
  end

  def split(list, count) when count >= 0 do
    split(list, count, [])
  end

  def split(list, 0, acc) when is_list(list) and is_list(acc) do
    [acc, list]
  end
  def split([head | tail], count, acc) when is_list(tail) and is_list(acc) do
    split(tail, count-1, acc ++ [head])
  end

  def take([], _) do
    []
  end
  def take(_, 0) do
    []
  end

  def take([head | tail], count) when count > 0 do
    [head] ++ take(tail, count - 1)
  end

  def flatten(list) do
    reverse(do_flatten(list))
  end
  def do_flatten([head | []]) when is_list(head) do
    do_flatten(head)
  end
  def do_flatten([head | []]) do
    [head]
  end

  def do_flatten([head | tail]) when is_list(head) do
    do_flatten(tail) ++ head
  end
  
  def do_flatten([head | tail]) do
    do_flatten(tail) ++ [head]
  end

  def reverse([head | []]) do
    [head]
  end

  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end

  def primes(up_to) when up_to > 2 do
    for x <- span(2, up_to), is_prime(x), do: x
  end

  def is_prime(x) do
    (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1
  end

  def span(from, to) when to < from do
    span(to, from)
    |> Enum.reverse
  end

  def span(from, to) when from == to do
    [from]
  end

  def span(from, to) do
    span([to], from, to-1)
  end
  defp span(list, from, to) when from == to do
    [to | list]
  end
  defp span(list, from, to) do
    span([to | list], from, to-1)
  end

  def taxes(orders, tax_rates) do
    for order <- orders do
      Keyword.put order, :total_amount, (1+Keyword.get(tax_rates, order[:ship_to], 0)) * order[:net_amount]
    end
  end
end
