require 'rubygems'

require 'sinatra'
require 'date'

get '/hello/:name' do |n|
  "Hello #{n}!"
end

get '/raceday/*/5kpace/*/' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end

get '/plan/racedate/:racedate/fivekmtime/:fivekmtime' do 
  
  # "racedate #{params[:racedate]} five km pace #{params[:fivekmpace]}"
  date = Date.parse(params[:racedate]) #1979-12-27
  fivekmtime = params[:fivekmtime]
  #extract the minutes and the seconds - add the minutes (*6) to the seconds and present as Time.at((m*60) + s).gmtime
  mins = fivekmtime.scan(/[1-9]+(?=m)/)[0].to_i
  sec = fivekmtime.scan(/[1-9]+(?=s)/)[0].to_i
  @runnerdata = RunnerData.new(date, Time.at((mins*60)+sec).gmtime)
  erb :trainingplan
end

get '/plan/' do
  "did it change?"
end

get '/' do
  "Hello world, it's #{Time.now} at the server!"
end

class RunnerData
 attr_reader :race_date
 attr_reader :five_km_time
 def initialize(racedate, fivekmtime)
   @race_date = racedate
   @five_km_time = fivekmtime
 end
 def five_km_pace
   seconds =  (five_km_time.to_i / 5)
   return Time.at(seconds).gmtime
 end
 def marathon_pace
   #display as mp.strftime
   return five_km_pace + 15 #TODO - this is not accurate
   #return "5m30s/km"
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
