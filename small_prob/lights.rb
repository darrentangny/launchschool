def lights(num_of_switches)
  lights = {}
  1.upto(num_of_switches) { |i| lights.store(i, 'off') } # populates hash
  1.upto(num_of_switches) do |i|
    lights.each do |k, v|
      if k % i == 0
        if lights[k] == 'off'
          lights[k] = 'on'
        else
          lights[k] = 'off'
        end
      end
    end
  end
  arr = []
  lights.each do |k,v|
    if lights[k] == 'on'
      arr << k
    end
  end
  arr
end

lights(5)
lights(10)