# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Observation: lenient arity for procs. Whether an argument is provided or not
# the call produces an output
# Proc objects can be created either with a call of `proc` or Proc.new

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')

# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Observation: lambda has strict arity--requires an argument for the block
# parameter. Interesting shorthand--the lambda literal: -> (param) {block}
# as shorthand for: lambda { |param| block }
# Lambdas are seemingly also procs, except with strict arity.
# Unlike procs, lambda cannot be created with `.new` call. Also, although a
# proc, there is a distinction when displayed with `(lambda)` showing at the 
# end of the object. 

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Observation: yield keyword determines whether argument is needed. More to do
# with the fact that it's a method than anything to do with the block.
# A block passed to a method doesn't require the correct number of arguments.
# If a block variable is defined and no value passed, `nil` will be assigned.
# If we have a `yield` and no block is passed, then an error is thrown.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# Blocks will throw an error if a variable is referenced that doesn't exist
# in the block's scope.


