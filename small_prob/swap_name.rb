def swap_name(str)
  arr = str.split
  "#{arr[1]}, #{arr[0]}"
end

swap_name('Joe Roberts') == 'Roberts, Joe'

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

def swap_name(first_last)
  first, last = first_last.split
  "#{last}, #{first}"
end