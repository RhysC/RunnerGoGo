require_relative "pace.rb"

class TimeTrial
  MILESCONVERSION = 0.621371192
  attr_reader :distance_in_km, :minutes, :seconds
  def initialize(distance_in_km, minutes, seconds)
    @distance_in_km = distance_in_km
    @minutes = minutes
    @seconds = seconds
  end
  def pace_in_minute_mile
    pace = ((minutes*60.0)+seconds) / (distance_in_km * MILESCONVERSION) / 60
    return Pace.new(pace.to_i , (pace % 1 * 60).to_i)
  end
  def pace_in_minute_km
    pace = ((minutes*60.0)+seconds) / distance_in_km / 60
    return Pace.new(pace.to_i , (pace % 1 * 60).to_i)
  end
end