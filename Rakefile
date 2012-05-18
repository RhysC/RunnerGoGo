task :default => [:test]

task :test do
  begin
    tests = []
    tests << "tests/pace_tests.rb"
    tests << "tests/home_tests.rb"
    tests << "tests/week_tests.rb"
    tests.each do |t|
      file = File.expand_path("../#{t}", __FILE__)
      ruby file
    end
  rescue Exception => e
    puts "error in Rake task :test is #{Dir.pwd}"
    puts e
    #puts e.backtrace
    raise
  end
end