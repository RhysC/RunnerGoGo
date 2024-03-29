require_relative 'week.rb'

class MarathonPlan
  attr_reader :pacehash
  def initialize(training_pace_hash)
    @pacehash = training_pace_hash
  end
  def create_plan(racedate)
      plan = Array.new()
      session16a = create_interval_session  "3 x 1600m (1min. RI)"
      session16b = create_tempo_session 3, 3, "ST", 0, 3
      session16c = create_tempo_session 0, 21, "MP", 19, 0
      plan << Week.new(racedate, 16, session16a, session16b, session16c)

      session15a = ["1600m warm-up", "4 x 800m (2 min. RI)", "10 minute cool-down"]
      session15b = create_tempo_session 1.5, 8, "MP", 0, 1.5 
      session15c = create_tempo_session 0, 24, "MP", 28, 0 
      plan << Week.new(racedate, 15, session15a, session15b, session15c)

      session14a = create_interval_session "1200, 1000, 800, 600, 400, 200 (all with 200m RI)"
      session14b = create_tempo_session 1.5, 8, "LT", 0, 1.5
      session14c = create_tempo_session 0, 27, "MP", 28, 0 
      plan << Week.new(racedate, 14, session14a, session14b, session14c)

      session13a = create_interval_session "5 x 1K (400m RI)"
      session13b = create_tempo_session 1.5, 7, "MT", 0, 1.5
      session13c = create_tempo_session 0, 32, "MP", 37, 0
      plan << Week.new(racedate, 13, session13a, session13b, session13c)

      session12a = create_interval_session "3 x 1600m (1 min. RI)"
      session12b = create_tempo_session 3, 5, "ST", 0, 2
      session12c = create_tempo_session 0, 29, "MP", 28, 0
      plan << Week.new(racedate, 12, session12a, session12b, session12c)

      session11a = create_interval_session "2 x 1200m (2 min. RI); 4 x 800m (2 min. RI)"
      session11b = create_tempo_session 0, 8, "MT", 0, 0
      session11c = create_tempo_session 0, 32, "MP", 28, 0
      plan << Week.new(racedate, 11, session11a, session11b, session11c)

      session10a = create_interval_session "6 x 800m (1:30 RI)"
      session10b = create_tempo_session 1.5, 10, "LT", 0, 1.5
      session10c = create_tempo_session 0, 21, "MP", 9, 0
      plan << Week.new(racedate, 10, session10a, session10b, session10c)

      session9a = create_interval_session "2 x (6 x 400m) (1:30 RI) (2:30 RI between sets)"
      session9b = create_tempo_session 3, 5, "ST", 0, 2
      session9c = create_tempo_session 0, 29, "MP", 19, 0
      plan << Week.new(racedate, 9, session9a, session9b, session9c)

      session8a = create_interval_session "1600 m (400m RI), 3200m (800m RI), 2 x 800m (400m RI)"
      session8b = create_tempo_session 1.5, 7, "MT", 0, 1.5
      session8c = create_tempo_session 0, 32, "MP", 19, 0
      plan << Week.new(racedate, 8, session8a, session8b, session8c)

      session7a = create_interval_session "3 x (2 x1200m) (2 min. RI) (4 min. between sets)"
      session7b = create_tempo_session 0, 16, "MP", 0, 0
      session7c = create_tempo_session 0, 24, "MP", 12, 0
      plan << Week.new(racedate, 7, session7a, session7b, session7c)

      session6a = create_interval_session "1K, 2K, 1K, 1K (400m RI)"
      session6b = create_tempo_session 2, 8, "MT", 0, 0
      session6c = create_tempo_session 0, 32, "MP", 19, 0
      plan << Week.new(racedate, 6, session6a, session6b, session6c)

      session5a = create_interval_session "3 x 1600m (400m RI)"
      session5b = create_tempo_session 0, 16, "MP", 0, 0
      session5c = create_tempo_session 0, 24, "MP", 6, 0
      plan << Week.new(racedate, 5, session5a, session5b, session5c)

      session4a = create_interval_session "10 x 400m (400m RI)"
      session4b = create_tempo_session 0, 13, "MP", 0, 0
      session4c = create_tempo_session 0, 32, "MP", 9, 0
      plan << Week.new(racedate, 4, session4a, session4b, session4c)

      session3a = create_interval_session "8 x 800m (1:30 RI)"
      session3b = create_tempo_session 0, 8, "MT", 0, 0
      session3c = create_tempo_session 0, 21, "MP", 9, 0
      plan << Week.new(racedate, 3, session3a, session3b, session3c)

      session2a = create_interval_session "5 x 1K (400m RI)"
      session2b = create_tempo_session 3, 5, "ST", 0, 2
      session2c = create_tempo_session 0, 16, "MP", 0, 0
      plan << Week.new(racedate, 2, session2a, session2b, session2c)

      session1a = create_interval_session "6 x 400m (400m RI)"
      session1b = create_tempo_session 0, 5, "MP", 0, 0
      session1c = create_tempo_session 0, 42, "MP", 0, 0
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
      currentSession = Array.new
      currentSession << "#{warmup_dist}K easy" if warmup_dist > 0
      modifier_string = if modifier > 0
                          " + #{modifier.to_s} sec/km"
                        end
      currentSession << "#{working_dist}K @ #{working_pace_key}#{modifier_string} (#{ (@pacehash[working_pace_key] + modifier).strftime('%M:%S') } sec/km)"
      currentSession << "#{warmdown_dist}K easy" if warmdown_dist > 0
      return currentSession
   end

   private :create_tempo_session
   private :create_interval_session
  end