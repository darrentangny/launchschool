def divisors(pos_int)
  (1..pos_int).select { |num| pos_int % num == 0 }
end

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# below method shows math principle to reduce number of iterations 

def divisors(n)
  return [1] if n == 1
  divisors = []
  (1..Math.sqrt(n)).each do |num|
    if n % num == 0
      divisors << num
      divisors << n / num
    end
  end
  divisors
end
