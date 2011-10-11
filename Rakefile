require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'selenium-webdriver'
require 'settings'


desc 'Default: run specs.'
task :default => :spec

desc "Generate HTML report for failing examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.rspec_opts = "-f html -o rspec.html"
end