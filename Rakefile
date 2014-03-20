require 'rake'
require 'puppet-lint/tasks/puppet-lint'
require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.send('with-filename')
PuppetLint.configuration.send('fail-on-warnings')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

desc "Check manifests, templates and ruby files for syntax errors."
task :validate do
  Dir['manifests/**/*.pp'].each do |file|
    sh "puppet parser validate --noop #{file}"
  end
  Dir['templates/**/*.erb'].each do |file|
    sh "erb -P -x -T '-' #{file} | ruby -c"
  end
  Dir['lib/**/*.rb'].each do |file|
    sh "ruby -c #{file}"
  end
end

task :default => [:validate, :lint, :spec]
