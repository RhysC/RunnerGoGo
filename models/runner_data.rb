require 'date'
require_relative 'marathon_training_pace.rb'
require_relative 'marathon_training_plan.rb'

class RunnerData
 attr_reader :race_date
 attr_reader :five_km_time, :five_km_pace
 attr_reader :pace, :marathon_prediction, :session_definitions
 attr_reader :weeks
 def initialize(racedate, fivekmtime)
   begin
      @race_date = racedate
      @five_km_time = fivekmtime
      @five_km_pace = Time.at(five_km_time.to_i / 5).gmtime

      @pace = MarathonPaces.create_from_5km_time(fivekmtime)
      @marathon_prediction = Time.at(@pace.marathon_pace.to_i * 42.2).gmtime
      
      plan = MarathonPlan.new(@pace.hash)
      @weeks = plan.create_plan(@race_date)
      @session_definitions = plan.session_definitions
   rescue Exception => e
    puts "error with params - racedate: #{racedate}, fivekmtime: #{fivekmtime}"
    puts e
    puts e.backtrace
    raise
   end
 end
end