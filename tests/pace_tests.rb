begin 
  # "try to use require_relative first"
  # "this only works for 1.9"
  require_relative '../models/time_trial.rb'
rescue NameError
  # "oops, must be using 1.8"
  # "no problem, this will load it then"
  require File.expand_path('../models/time_trial.rb', __FILE__)
end

require 'test/unit'

class PaceTest < Test::Unit::TestCase
  
  def test_nill_minutes_is_invalid
    assert_raise(ArgumentError) {Pace.new(nil, 0)}
  end
  def test_nill_seconds_is_invalid
    assert_raise(ArgumentError) {Pace.new(0,nil)}
  end
  def test_negative_minutes_is_invalid
    assert_raise(ArgumentError) {Pace.new(-1, 0)}
  end
  def test_negative_seconds_is_invalid
    assert_raise(ArgumentError) {Pace.new(0,-1)}
  end
  
  def test_PaceInMinMiles
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_mile()
    assert_equal 6, pace.minutes
    assert_equal 45, pace.seconds
  end
  
  def test_PaceInMinKm
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_km()
    assert_equal 4, pace.minutes
    assert_equal 12, pace.seconds
  end
  
  def test_Minus_from_PaceInMinMile
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_mile()
    assert_equal 6, pace.minutes
    assert_equal 45, pace.seconds
    new_pace = pace - 45
    assert_equal 6, new_pace.minutes
    assert_equal 0, new_pace.seconds
  end
  
  def test_Minus_from_PaceInMinKm
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_km()
    assert_equal 4, pace.minutes
    assert_equal 12, pace.seconds
    new_pace = pace - 45
    assert_equal 3, new_pace.minutes
    assert_equal 27, new_pace.seconds
  end

  def test_Plus_from_PaceInMinMile
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_mile()
    assert_equal 6, pace.minutes
    assert_equal 45, pace.seconds
    new_pace = pace + 15
    assert_equal 7, new_pace.minutes
    assert_equal 0, new_pace.seconds
  end
  
  def test_Minus_from_PaceInMinKm
    timetrial = TimeTrial.new(10.00, 42, 0)
    pace = timetrial.pace_in_minute_km()
    assert_equal 4, pace.minutes
    assert_equal 12, pace.seconds
    new_pace = pace + 15
    assert_equal 4, new_pace.minutes
    assert_equal 27, new_pace.seconds
  end

end