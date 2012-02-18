require 'date'
require './pace_time.rb'

class RunnerData
 attr_reader :race_date
 attr_reader :five_km_time
 attr_reader :marathon_pace
 def initialize(racedate, fivekmtime)
   @race_date = racedate
   @five_km_time = fivekmtime
   fivekmseconds =  five_km_time.to_i
   rounding = fivekmseconds % 5 
   key = (fivekmseconds + (5-rounding))
   puts "fivekmseconds = #{fivekmseconds}"
   puts "rounding = #{rounding}"
   puts "key = #{key}"
   puts "hash count = #{PaceTime.MarathonPace().count}"
   mp_in_sec = PaceTime.MarathonPace()[key]
   puts "Mp in Secs = #{mp_in_sec}"
   @marathon_pace = Time.at(mp_in_sec).gmtime
 end
 def five_km_pace
   seconds =  (five_km_time.to_i / 5)
   return Time.at(seconds).gmtime
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
