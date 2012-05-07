require 'date'
require_relative 'marathon_training_pace.rb'
require_relative 'marathon_training_plan.rb'
require_relative 'half_marathon_training_pace.rb'
require_relative 'half_marathon_training_plan.rb'

#TODO - common logic to be factored to a common place
class MarathonRunnerData
 attr_reader :race_date
 attr_reader :five_km_time, :five_km_pace
 attr_reader :pace, :race_prediction, :session_definitions
 attr_reader :weeks
 def initialize(racedate, fivekmtime)
   begin
      @race_date = racedate
      @five_km_time = fivekmtime
      @five_km_pace = Time.at(five_km_time.to_i / 5).gmtime

      @pace = MarathonPaces.create_from_5km_time(fivekmtime)
      @race_prediction = @pace.race_prediction
      
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

class HalfMarathonRunnerData
 attr_reader :race_date
 attr_reader :five_km_time, :five_km_pace
 attr_reader :pace, :race_prediction, :session_definitions
 attr_reader :weeks
 def initialize(racedate, fivekmtime)
   begin
      @race_date = racedate
      @five_km_time = fivekmtime
      @five_km_pace = Time.at(five_km_time.to_i / 5).gmtime

      @pace = HalfMarathonPaces.create_from_5km_time(fivekmtime)
      @race_prediction = @pace.race_prediction
      plan = HalfMarathonPlan.new(@pace.hash)
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