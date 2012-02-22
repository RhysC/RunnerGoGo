require 'date'
require './pace_time.rb'
require './EasyPace.rb'
require './ShortPace.rb'
require './MediumPace.rb'
require './LongPace.rb'

class RunnerData
 attr_reader :race_date
 attr_reader :five_km_time
 attr_reader :five_km_pace
 attr_reader :marathon_pace
 attr_reader :short_tempo_pace
 attr_reader :medium_tempo_pace
 attr_reader :long_tempo_pace
 attr_reader :easy_pace
 def initialize(racedate, fivekmtime)
   @race_date = racedate
   @five_km_time = fivekmtime
   fivekmseconds =  five_km_time.to_i
   seconds =  (fivekmseconds / 5)
   @five_km_pace = Time.at(seconds).gmtime
   rounding = fivekmseconds % 5 
   key = (fivekmseconds + (5-rounding))
   
   mp_in_sec = PaceTime.MarathonPace()[key]
   @marathon_pace = Time.at(mp_in_sec).gmtime
   
   easy_in_sec = EasyPaceTime.EasyPace()[key]
   @easy_pace = Time.at(easy_in_sec).gmtime
   
   short_in_sec = MediumPaceTime.MediumPace()[key]
   @short_tempo_pace = Time.at(short_in_sec).gmtime
   
   med_in_sec = ShortPaceTime.ShortPace()[key]
   @medium_tempo_pace = Time.at(med_in_sec).gmtime
   
   long_in_sec = LongPaceTime.LongPace()[key]
   @long_tempo_pace = Time.at(long_in_sec).gmtime
 end
 
 def ShortTempoPace
   return "4m15s/km"
 end
 def MediumTempoPace
   return "4m35s/km"
 end
 def LongTempoPace
   return "4m55s/km"
 end
end
