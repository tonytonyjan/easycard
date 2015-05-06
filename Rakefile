require 'rake/testtask'
Rake::TestTask.new

require 'rubygems/package_task'
spec = Gem::Specification.load(File.join(__dir__, 'easycard.gemspec'))
Gem::PackageTask.new(spec).define