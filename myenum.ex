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
end
