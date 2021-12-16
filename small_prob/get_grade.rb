def get_grade(s1, s2, s3)
  avg = (s1 + s2 + s3) / 3.0
  case
  when average >= 90 then 'A'
  when average >= 80 then 'B'
  when average >= 70 then 'C'
  when average >= 60 then 'D'
  else                    'F'
  end
end

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

def get_grade(*scores)
  average = (scores.sum.to_f / scores.count).round(2)

  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end