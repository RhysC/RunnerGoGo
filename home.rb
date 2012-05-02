require 'rubygems'
require 'sinatra'
require 'date'
require_relative './models/runner_data.rb'

helpers do
  def partial (template, locals = {})
    erb(template, :layout => false, :locals => locals)
  end
end

get '/' do
  erb :home
end
get '/about' do
  erb :about
end
get '/contact' do
  erb :contact
end

get '/racedate/:racedate/fivekmtime/:fivekmtime' do 
  begin
    # "racedate #{params[:racedate]} five km pace #{params[:fivekmpace]}"
    date = Date.parse(params[:racedate]) #1979-12-27
    fivekmtime = params[:fivekmtime]
    #extract the minutes and the seconds - add the minutes (*6) to the seconds and present as Time.at((m*60) + s).gmtime
    mins = fivekmtime.scan(/[0-9]+(?=m)/)[0].to_i
    sec = fivekmtime.scan(/[0-9]+(?=s)/)[0].to_i
    @runnerdata = RunnerData.new(date, Time.at((mins*60)+sec).gmtime)
    erb :trainingplan
  rescue Exception => e
    puts "error with params #{params}"
    puts e
    puts e.backtrace
    raise
  end
end