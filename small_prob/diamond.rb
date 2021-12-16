def diamond(num)
  spaces = 0
  stars = num
  until stars == 1
    stars -= 2
    spaces += 1
  end
  loop do
    spaces.times { print " "}
    stars.times { print "*" }
    spaces.times { print " "}
    print "\n"
    spaces -= 1
    stars += 2
    break if stars > num
  end
  stars -= 4
  spaces += 2
  loop do
    spaces.times  { print " " }
    stars.times { print "*" }
    spaces.times { print " " }
    print "\n"
    break if stars < 1
    spaces += 1
    stars -= 2
  end
end

diamond(3)

def diamond(grid_size)
  max_distance = grid_size / 2
  max_distance.downto(0)  { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)    { |distance| print_row(grid_size, distance) }
end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end