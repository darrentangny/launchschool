# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  # def to_a
  #   @todos
  # end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  # def item_at(element)
  #   if @todos[element]
  #     @todos[element]
  #   else
  #     raise IndexError # check if this was properly implemented
  #   end
  # end

  # def mark_done_at(element)
  #   if @todos[element]
  #     @todos[element].done!
  #   else
  #     raise IndexError
  #   end
  # end

  # def mark_undone_at(element)
  #   if @todos[element]
  #     @todos[element].undone!
  #   else
  #     raise IndexError
  #   end
  # end

  def item_at(element)
    @todos.fetch(element)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(element)
    if @todos[element]
      @todos.delete_at(element)
    else
      raise IndexError
    end
  end

  # def to_s
  #   @todos.each { |todo| puts todo }
  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    @todos.each { |todo| yield(todo) }
  end
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

p list.size
p list.first
p list.last
p list.to_a
p list.done?
# p list.item_at
p list.item_at(1)
# p list.item_at(100)
# p list.mark_done_at
p list.mark_done_at 1
# p list.mark_done_at 100
# p list.mark_undone_at             # raises ArgumentError
p list.mark_undone_at(1)          # marks the 2nd item as not done,
# p list.mark_undone_at(100)        # raises IndexError
# puts list
list.done!
# list.remove_at
# p list.remove_at 1
# p list.remove_at 100
# puts list

list.each do |todo|
  puts todo
end