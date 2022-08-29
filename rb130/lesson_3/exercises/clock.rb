# class Clock
#   attr_accessor :hour, :minute

#   def initialize(hour, minute = 0)
#     @hour = hour
#     @minute = minute
#   end

#   def +(added_minutes)
#     arr = (minute + added_minutes).divmod(60)
#     self.hour += arr[0]
#     hour_adjustment
#     self.minute = arr[1]
#     self
#   end

#   def -(subtracted_minutes)
#     arr = (minute - subtracted_minutes).divmod(60)
#     self.hour += arr[0]
#     hour_adjustment
#     self.minute = arr[1]
#     self
#   end

#   def self.at(hour, minute = 0)
#     Clock.new(hour, minute)
#   end

#   def to_s
#     "%02d" % hour + ":" + "%02d" % minute
#   end

#   def ==(other_clock)
#     hour == other_clock.hour && minute == other_clock.minute
#   end

#   private

#   def hour_adjustment
#     self.hour = hour % 24
#   end
# end

# LS
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    self.class.new(hours, minutes)
  end
end