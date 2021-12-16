def fibonacci(nth)
  if nth < 2
    return nth
  else
    nth = (fibonacci(nth - 1)) + (fibonacci(nth - 2))
  end
  nth
end
# problem: multiple recursion trees invoked, here. cpu sputters out.
# see solution below

def fibonacci(nth)
  return nth if nth < 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1 # this is only to cover fibonacci(1) scenario
    acc1
  elsif nth == 2 # otherwise, this is all that's necessary
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end