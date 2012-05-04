class Week 
  attr_reader :week_number, :week_ended
  attr_reader :session_one, :session_two, :session_three
  def initialize(race_date, week_number, session_one, session_two, session_three )
    @week_number = week_number
    @week_ended =  (race_date - ((week_number - 1 )*7))
    @session_one = session_one
    @session_two = session_two
    @session_three = session_three
  end
  def relative_state
    today = Date.today
    return "current" if(today.cwyear == week_ended.cwyear && today.cweek == week_ended.cweek)
    return "historic" if(Date.today > week_ended)
    return "future"
  end
  def currrent_week?
    today = Date.today
    return today.cwyear == week_ended.cwyear && today.cweek == week_ended.cweek
  end
  def sessions
    return [@session_one, @session_two, @session_three]
  end
end