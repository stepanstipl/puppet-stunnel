require 'simplecov'
require 'coveralls'
require 'puppetlabs_spec_helper/module_spec_helper'

# Tests coverage
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
    add_filter "/spec/"
end

