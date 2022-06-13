def some_method(arg)
  yield(arg)
  # other_method(yield(arg))
  other_method(some_proc)
end

def sequence
  counter = 0
  Proc.new {counter += 1}
end


p sequence
p sequence

var = sequence
3.times {p var.call}

def call_me(some_code)
  some_code.call
end

class String
  def to_proc
    Proc.new {self}
  end
end

str = 'Bob'
call_me(&str)

# to_proc  Symbol#to_proc
