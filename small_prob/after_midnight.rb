def time_of_day(num)
  num += 1440 if num < 0
  num = num % 1440
  hour, minute = num.divmod(60)
  "#{format('%02d', hour)}:#{format('%02d', minute)}"
  # alt version: format("%02d:%02d", hours, minutes) --verbatim, no surrounding quotes
end

=begin
A better understanding of divmod and modulo could yield this:

def time_of_day(number)
  hours, minutes=number.divmod(60)
  hours_24=hours%24
  "#{format('%02d', hours_24)}:#{format('%02d',minutes)}"
end
=end

def after_midnight(time_str)
  hours, minutes = time_output.split(':').map(&:to_i)
  (hours * 60 + minutes) % 1440
end

def before_midnight(time_str)
  delta_minutes = 1440 - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == 1440
  delta_minutes
end