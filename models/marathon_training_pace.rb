require_relative '../PaceHashes/MarathonPace.rb'

class MarathonPaces
  
  attr_reader :fivekm_racetime_sec, :marathon_pace
   
  def self.create_from_5km_time(five_km_time)
    rounding = five_km_time.to_i % 5 
    time_in_secs = (five_km_time.to_i + (5-rounding))
    return new(time_in_secs)
  end 
  
  def initialize(fivekm_racepace_in_seconds)
    @fivekm_racetime_sec = fivekm_racepace_in_seconds
    mp_in_sec = MarathonPaceTime.MarathonPace()[fivekm_racepace_in_seconds]
    @marathon_pace = Time.at(mp_in_sec).gmtime
  end
  
  def easy
    pace = (@fivekm_racetime_sec / 5) +70
    return Time.at(pace).gmtime
  end
  def short
    pace = (@fivekm_racetime_sec / 5) +11
    return Time.at(pace).gmtime
  end
  def medium
    pace = (@fivekm_racetime_sec / 5) +20
    return Time.at(pace).gmtime
  end
  def long
    pace = (@fivekm_racetime_sec / 5) +29
    return Time.at(pace).gmtime
  end
  
end