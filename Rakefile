require "bundler/gem_tasks"
require "rake/testtask"

task :default => :travis
task :travis => ["test", "test:travis"]
task :console do
  exec "pry -r fog/packet -I ./lib"
end

Rake::TestTask.new do |t|
  t.libs.push %w[spec]
  t.test_files = FileList["tests/**/**/**.rb"]
  t.verbose = true
end

namespace :test do
  mock = ENV["FOG_MOCK"] || "true"
  task :travis do
    sh("export FOG_MOCK=#{mock} && bundle exec minitest")
  end
end

desc "Default Task"
task :default => [:test]
