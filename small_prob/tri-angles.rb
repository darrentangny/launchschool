def triangle(angle1, angle2, angle3)
  if angle1 + angle2 + angle3 != 180
    :invalid
  elsif angle1 == 0 || angle2 == 0 || angle3 == 0
    :invalid
  elsif angle1 == 90 || angle2 == 90 || angle3 == 90
    :right
  elsif angle1 < 90 && angle2 < 90 && angle3 < 90
    :acute
  elsif angle1 > 90 || angle2 > 90 || angle3 > 90
    :obtuse
  end
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid