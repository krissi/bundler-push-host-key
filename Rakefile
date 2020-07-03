$LOAD_PATH << File.join(__dir__, 'lib')

require "rake/testtask"
require 'bundler/gem_tasks/push_host_key'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/test_*.rb"]
end
