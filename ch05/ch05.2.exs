fizzbuzz = fn
  (0,0,_) -> IO.puts "FizzBuzz"
  (0,_,_) -> IO.puts "Fizz"
  (_,0,_) -> IO.puts "Buzz"
  (_,_,c) -> IO.puts c
end

fb = fn(n) ->
    fizzbuzz.(rem(n,3), rem(n,5), n)
end

Enum.map(1..20, fb)
