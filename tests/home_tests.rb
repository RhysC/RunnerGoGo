begin 
  # try to use require_relative first
  # this only works for 1.9
  require_relative '../home.rb'
rescue NameError
  # oops, must be using 1.8
  # no problem, this will load it then
  require File.expand_path('../home.rb', __FILE__)
end

require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  def plans
    return ['marathon', 'halfmarathon']
  end
  
  def test_default_welcome
    get '/'
    assert last_response.ok?
    assert_match /Welcome to RunnerGoGo.com/, last_response.body
  end
  
  def test_static_pages_have_hero
    get '/'
    assert last_response.ok?
    assert_match /Ready, Set, GoGo!/, last_response.body
  end

  def test_plan_with_params
    plans.each do | plan|
      get "/#{plan}/14-05-2012/fivekmtime/21m35s"
      assert last_response.ok?, "response is not ok :("
      assert_match /Race date : Mon 14 May 2012/, last_response.body
      assert_match /Times are based on the pace of a 5km race at the given pace 04:19/, last_response.body 
    end
  end
  
  def test_all_5km_run_times_between_15_and_40_minutes
    plans.each do | plan |
      settings.pace_range.each do |minute| 
        ((0..59).select {|x| (x % 5) ==0}).each do |second| 
          get "/#{plan}/14-05-2012/fivekmtime/#{minute}m#{second}s" #, :name => 'Frank'
          assert last_response.ok?, "response is not ok :("
        end
    	end
	  end
  end
  
end