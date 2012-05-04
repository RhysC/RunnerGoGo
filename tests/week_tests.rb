begin 
  # "try to use require_relative first"
  # "this only works for 1.9"
  require_relative '../models/week.rb'
rescue NameError
  # "oops, must be using 1.8"
  # "no problem, this will load it then"
  require File.expand_path('../models/week.rb', __FILE__)
end

require 'test/unit'
require 'date'

class WeekTest < Test::Unit::TestCase
  
  def test_today_is_current
    weeks_out = 3
    racedate = Date.today + ((weeks_out-1) *7)
    assert_equal "current", Week.new(racedate,weeks_out,nil,nil,nil).relative_state
  end
  def test_last_week_is_historic
    weeks_out = 3
    racedate = Date.today + ((weeks_out-1) *7)
    assert_equal "historic", Week.new(racedate,weeks_out+1,nil,nil,nil).relative_state
  end
  def test_next_week_is_future
    weeks_out = 3
    racedate = Date.today + ((weeks_out-1) *7)
    assert_equal "future", Week.new(racedate,weeks_out-1,nil,nil,nil).relative_state
  end
  def test_today_currrent_week_is_true
    weeks_out = 3
    racedate = Date.today + ((weeks_out-1) *7)
    assert Week.new(racedate,weeks_out,nil,nil,nil).currrent_week?
  end
end