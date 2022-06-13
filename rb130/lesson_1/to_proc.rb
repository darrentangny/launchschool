def my_method
  yield(2)
end

a_proc = :to_s.to_proc

puts my_method(&a_proc)