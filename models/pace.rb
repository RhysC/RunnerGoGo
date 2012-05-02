class Pace #Not currently being used - was in progress for half marathon program then realised the marathon code needed alot of work
  attr_reader :time, :minutes, :seconds
  
  def initialize(minutes, seconds)
    if(minutes.nil? || seconds.nil? || minutes < 0 || seconds < 0)
      raise ArgumentError, "Minutes and seconds must not be null or less than zero : minutes #{minutes}, seconds #{seconds}"
    end
    @minutes = minutes
    @seconds = seconds
    @time = (minutes * 60) + seconds
  end
  
  def -(mod_in_seconds)
    new_total = time - mod_in_seconds
    new_mins = (new_total / 60).to_i
    new_secs = (new_total % 60)
    return Pace.new(new_mins, new_secs)
  end
  def +(mod_in_seconds)
    new_total = time + mod_in_seconds
    new_mins = (new_total / 60).to_i
    new_secs = (new_total % 60)
    return Pace.new(new_mins, new_secs)
  end
  
end