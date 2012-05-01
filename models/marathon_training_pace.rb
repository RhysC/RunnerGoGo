class MarathonTraining
  #TODO change to a non static domain object
  def self.EasyPace(fivekm_pace)#in seconds
    return  (fivekm_pace / 5) +70
  end
  def self.ShortPace(fivekm_pace)#in seconds
    return  (fivekm_pace / 5) +11
  end
  def self.MediumPace(fivekm_pace)#in seconds
    return  (fivekm_pace / 5) +20
  end
  def self.LongPace(fivekm_pace)#in seconds
    return  (fivekm_pace / 5) +29
  end
end