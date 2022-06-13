def step(start_val, ending_val, step_val)
  current_val = start_val
  until current_val > ending_val
    yield(current_val)
    current_val += step_val
  end
  current_val
end

step(1, 10, 3) { |value| puts "value = #{value}" }