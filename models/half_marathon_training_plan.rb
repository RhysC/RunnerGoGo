require_relative 'week.rb'

class HalfMarathonPlan #TODO - miles ->km runs and non compliant tempo runs
  attr_reader :pacehash
  def initialize(training_pace_hash)
    @pacehash = training_pace_hash
  end
  def create_plan(racedate)
      plan = Array.new()
      session18a = create_interval_session  "12 x 400m (90 sec. RI)"
      session18b = create_tempo_session 2, 3, "ST", 0, 1
      session18c = create_tempo_session 0, 8, "HMP", 20, 0
      plan << Week.new(racedate, 18, session18a, session18b, session18c)
      
      session17a = create_interval_session  "400, 600, 800, 1200, 800, 600, 400 (400 RI)"
      session17b = create_tempo_session 0, 5, "MT", 0, 0
      session17c = create_tempo_session 0, 9, "HMP", 20, 0
      plan << Week.new(racedate, 17, session17a, session17b, session17c)
      
      session16a = create_interval_session  "6 x 800m (90 sec. RI)"
      session16b = create_tempo_session 2, 3, "ST", 0, 1
      session16c = create_tempo_session 0, 10, "EP", 20, 0
      plan << Week.new(racedate, 16, session16a, session16b, session16c)
      
      session15a = create_interval_session  "1200, 1000, 800, 600, 400, 200 (200M RI)"
      session15b = create_tempo_session 0, 5, "MT", 0, 0
      session15c = create_tempo_session 0, 9, "HMP", 20, 0
      plan << Week.new(racedate, 15, session15a, session15b, session15c)
      
      session14a = create_interval_session  "5 x 1K (400m RI)"
      session14b = create_tempo_session 1, 3, "ST", 0, 1
      session14c = create_tempo_session 0, 9, "HMP", 20, 0
      plan << Week.new(racedate, 14, session14a, session14b, session14c)

      session13a = create_interval_session  "3 x 1600m (1 min. RI)"
      session13b = create_tempo_session 0, 6, "LT", 0, 0
      session13c = create_tempo_session 0, 11, "HMP", 30, 0
      plan << Week.new(racedate, 13, session13a, session13b, session13c)

      session12a = create_interval_session  "2 x 1200m (2:00 RI); 4 x 800m (2:00 RI)"
      session12b = create_tempo_session 1, 2, "MT", 0, 0 #TODO (non conforming session) : 1 mile easy, 2 miles @ MT pace 1 mile easy, 2 miles @ MT pace 1 mile easy
      session12c = create_tempo_session 0, 10, "HMP", 20, 0
      plan << Week.new(racedate, 12, session12a, session12b, session12c)
      
      session11a = create_interval_session  "6 x 800m (1:30 RI)"
      session11b = create_tempo_session 0, 5, "MT", 0, 0
      session11c = create_tempo_session 0, 12, "HMP", 30, 0
      plan << Week.new(racedate, 11, session11a, session11b, session11c)

      session10a = create_interval_session  "2 x (6 x 400m) (1:30 RI) (2:30 RI between sets)"
      session10b = create_tempo_session 1, 2, "MT", 0, 1 #TODO (non conforming session) : 1 mile easy, 2 miles @ MT pace 1 mile easy, 2 miles @ MT pace 1 mile easy
      session10c = create_tempo_session 0, 8, "HMP", 15, 0
      plan << Week.new(racedate, 10, session10a, session10b, session10c)

      session9a = create_interval_session  "1 mile (400 RI), 2 miles (800 RI), 2 x 800m (400m RI)"
      session9b = create_tempo_session 0, 5, "MT", 0, 0
      session9c = create_tempo_session 0, 13, "HMP", 30, 0
      plan << Week.new(racedate, 9, session9a, session9b, session9c)
      
      session8a = create_interval_session  "3 x (2 x 1200m) (2:00 RI) (4:00 RI between sets)"
      session8b = create_tempo_session 0, 6, "MT", 0, 0
      session8c = create_tempo_session 0, 10, "HMP", 20, 0
      plan << Week.new(racedate, 8, session8a, session8b, session8c)
      
      session7a = create_interval_session  "1K, 2K, 1K, 1K (400m RI)"
      session7b = create_tempo_session 0, 5, "MT", 0, 0
      session7c = create_tempo_session 0, 14, "HMP", 30, 0
      plan << Week.new(racedate, 7, session7a, session7b, session7c)

      session6a = create_interval_session  "3 x 1600m (400m RI)"
      session6b = create_tempo_session 0, 6, "EP", 0, 0
      session6c = create_tempo_session 0, 10, "HMP", 20, 0
      plan << Week.new(racedate, 6, session6a, session6b, session6c)

      session5a = create_interval_session  "10 x 400m (400m RI)"
      session5b = create_tempo_session 0, 5, "MT", 0, 0
      session5c = create_tempo_session 0, 15, "HMP", 30, 0
      plan << Week.new(racedate, 5, session5a, session5b, session5c)
      
      session4a = create_interval_session  "3 x 2000m (400m RI)"
      session4b = create_tempo_session 1, 2, "MT", 0, 0 #TODO (non conforming session) : 1 mile easy, 2 miles @ MT pace 1 mile easy, 2 miles @ MT pace 1 mile easy
      session4c = create_tempo_session 0, 10, "HMP", 20, 0
      plan << Week.new(racedate, 4, session4a, session4b, session4c)

      session3a = create_interval_session  "2 x 3200 (400m RI)"
      session3b = create_tempo_session 0, 5, "MT", 0, 0
      session3c = create_tempo_session 0, 12, "HMP", 20, 0
      plan << Week.new(racedate, 3, session3a, session3b, session3c)

      session2a = create_interval_session  "5 x 1K (400mRI)"
      session2b = create_tempo_session 2, 3, "ST", 0, 1
      session2c = create_tempo_session 0, 8, "HMP", 20, 0
      plan << Week.new(racedate, 2, session2a, session2b, session2c)

      session1a = create_interval_session  "6 x 400m (400m-RI) "
      session1b = create_tempo_session 0, 3, "EP", 0, 0
      session1c = create_tempo_session 0, 13, "HMP", 0, 0
      plan << Week.new(racedate, 1, session1a, session1b, session1c)
      return plan
  end
      
   def session_definitions
      return ["Run 1 - Intervals ","Run 2 - Tempo ","Run 3 - Distance" ]
   end

  def create_interval_session(intervals)
   return [ "10-20 minute warm-up", intervals, "10 minute cool-down"]
  end
  
  def create_tempo_session(warmup_dist, working_dist, working_pace_key, modifier, warmdown_dist)
    #NOTE these paces are in miles not KM!
    currentSession = Array.new
    currentSession << "#{warmup_dist} Miles easy" if warmup_dist > 0
    modifier_string = if modifier > 0
                        " + #{modifier.to_s} sec/km"
                      end
    if(!@pacehash[working_pace_key])     
      raise "key #{working_pace_key} does not extist in pace hash"    
    end         
    currentSession << "#{working_dist} Miles @ #{working_pace_key}#{modifier_string} (#{ (@pacehash[working_pace_key] + modifier).strftime('%M:%S') } sec/km)"
    currentSession << "#{warmup_dist} Miles easy" if warmdown_dist > 0
    return currentSession
  end

  private :create_tempo_session
  private :create_interval_session
end