require 'rubygems'
require 'sinatra'
require 'date'
require_relative './models/runner_data.rb'

set :pace_range, (15..39)

helpers do
  def partial (template, locals = {})
    begin
      erb(template, :layout => false, :locals => locals)
    rescue Exception => e
      puts "error rendering partial with params #{locals}"
      puts e
      puts e.backtrace
      raise
    end
  end
end

get '/' do
  erb :"pages/home"
end
get '/about' do
  erb :"pages/about"
end
get '/contact' do
  erb :"pages/contact"
end

get '/marathon/:racedate/fivekmtime/:fivekmtime' do 
  @runnerdata = get_runner_data{ |date, time| RunnerData.new(date, time, MarathonStrategy.new()) }
  erb :"pages/trainingplan"
end

get '/halfmarathon/:racedate/fivekmtime/:fivekmtime' do 
  @runnerdata = get_runner_data{ |date, time| RunnerData.new(date, time, HalfMarathonStrategy.new()) }
  erb :"pages/trainingplan"
end


def get_runner_data(&data_factory)
  begin
    # "racedate #{params[:racedate]} five km pace #{params[:fivekmpace]}"
    date = Date.parse(params[:racedate]) #1979-12-27
    pace_in_seconds = get_pace(params[:fivekmtime])
    return data_factory.call(date, pace_in_seconds)
  rescue Exception => e
    puts "error with params #{params}"
    puts e
    puts e.backtrace
    raise
  end
end

def get_pace(fivekmtime)
  #extract the minutes and the seconds - add the minutes (*6) to the seconds and present as Time.at((m*60) + s).gmtime
  mins = fivekmtime.scan(/[0-9]+(?=m)/)[0].to_i
  sec = fivekmtime.scan(/[0-9]+(?=s)/)[0].to_i
  return Time.at((mins*60)+sec).gmtime
end
  

class Button 
  attr_reader :text, :id
  def initialize(id, text)
    @text = text
    @id = id
  end
end