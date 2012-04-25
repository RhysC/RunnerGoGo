require 'rubygems'
require 'sinatra'
require 'date'
require './runner_data.rb'

get '/' do
  erb :home
end

get '/racedate/:racedate/fivekmtime/:fivekmtime' do 
  
  # "racedate #{params[:racedate]} five km pace #{params[:fivekmpace]}"
  date = Date.parse(params[:racedate]) #1979-12-27
  fivekmtime = params[:fivekmtime]
  #extract the minutes and the seconds - add the minutes (*6) to the seconds and present as Time.at((m*60) + s).gmtime
  mins = fivekmtime.scan(/[0-9]+(?=m)/)[0].to_i
  sec = fivekmtime.scan(/[0-9]+(?=s)/)[0].to_i
  @runnerdata = RunnerData.new(date, Time.at((mins*60)+sec).gmtime)
  puts " runnerdata marathon_prediction #{@runnerdata.marathon_prediction}"
  
  erb :trainingplan
end