require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/test_helper.rb", "test/event_finda_ruby/*_test.rb"]
  t.verbose = true
end

desc "Run tests"
task :default => :test
