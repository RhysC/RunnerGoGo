require 'date'

class HalfMarathonPaces
  
  attr_reader :fivekm_racetime_sec, :race_pace, :easy, :short, :medium, :long, :race_prediction
   
  def self.create_from_5km_time(five_km_time)
    rounding = five_km_time.to_i % 5 
    time_in_secs = (five_km_time.to_i + (5-rounding))
    return new(time_in_secs)
  end 
  
  def initialize(fivekm_racepace_in_seconds)
    @fivekm_racetime_sec = fivekm_racepace_in_seconds
    one_km_pace = (@fivekm_racetime_sec / 5)
    @race_pace = Time.at(one_km_pace + 20).gmtime
    @easy = Time.at(one_km_pace + 70).gmtime
    @short = Time.at(one_km_pace).gmtime
    @medium = Time.at(one_km_pace + 15).gmtime
    @long = Time.at(one_km_pace + 20).gmtime
    @race_prediction = Time.at(@race_pace.to_i * 21.1).gmtime
  end

  def hash()
    return { 
             "EP"  => easy,
             "ST"  => short, 
             "MT"  => medium, 
             "LT"  => long,
             "HMP" => race_pace
           }
  end
end