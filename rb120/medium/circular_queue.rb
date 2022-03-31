# Commented-out portions indicate alternative arrangement where #enqueue method
# does not take an argument, and automatically increments age

class CircularQueue
  attr_reader :hsh
  def initialize(num)
    @queue_size = num
    @hsh = populate_hsh(num)
    @last_position_added = ('p' + num.to_s).to_sym
    # @next_obj_age = 0
  end

  # def enqueue
  #   if queue_empty? then add_first_obj
  #   else
  #     @hsh[next_position] = QueueObject.new(@next_obj_age)
  #     @next_obj_age += 1      
  #   end
  # end

  def enqueue(age)
    if queue_empty? then add_first_obj
    else
      @hsh[next_position] = QueueObject.new(age)
    end
  end
  
  def dequeue
    unless queue_empty?
      oldest_obj, oldest_age = @hsh.compact.min_by { |_,v| v.age }
      @hsh[oldest_obj] = nil
      return oldest_age.age
    end
    nil
  end

  # private

  def populate_hsh(num)
    hsh = Hash.new
    num.times do |num|
      hsh[('p' + (num + 1).to_s).to_sym] = nil
    end
    hsh
  end

  def queue_empty?
    @hsh.any? { |_,v| v != nil } == false
  end

  # def add_first_obj
  #   @hsh[:p1] = QueueObject.new(@next_obj_age)
  #   @next_obj_age += 1
  #   @last_position_added = :p1
  # end

  def add_first_obj
    @hsh[:p1] = QueueObject.new(1)
    @last_position_added = :p1
  end

  def next_position
    last_key_used = @hsh.compact.max_by { |_,queue_obj| queue_obj.age }.to_a[0]

    pos_number = last_key_used.to_s.chars.last.to_i
    if pos_number < @queue_size
      return ('p' + (pos_number + 1).to_s).to_sym
    else
      return :p1
    end
  end

  def queue_full?
    @hsh.any? { |_,v| v != nil } == false
  end
end

class QueueObject
  attr_reader :age

  def initialize(age)
    @age = age
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# Launch School Solution

# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @next_position = 0
#     @oldest_position = 0
#   end

#   def enqueue(object)
#     unless @buffer[@next_position].nil?
#       @oldest_position = increment(@next_position)
#     end

#     @buffer[@next_position] = object
#     @next_position = increment(@next_position)
#   end

#   def dequeue
#     value = @buffer[@oldest_position]
#     @buffer[@oldest_position] = nil
#     @oldest_position = increment(@oldest_position) unless value.nil?
#     value
#   end

#   private

#   def increment(position)
#     (position + 1) % @buffer.size
#   end
# end