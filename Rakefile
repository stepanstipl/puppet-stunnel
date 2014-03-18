require 'rake'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.send('with-filename')
PuppetLint.configuration.send('fail-on-warnings')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

desc "Run puppet parser to check for syntax errors."
task :validate do
  Dir['manifests/**/*.pp'].each do |path|
    sh "puppet parser validate #{path}"
  end
end

desc "Run ruby to check for ERB templates errors."
task :validate_templates do
  Dir['templates/**/*.erb'].each do |path|
    sh "erb -P -x -T '-' #{path} | ruby -c"
  end
end

task :default => [:validate, :validate_templates, :lint, :spec]
