#require 'beaker-rspec'

UNSUPPORTED_PLATFORMS = ['Suse','windows','AIX','Solaris']

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'apt')
    hosts.each do |host|
      shell('/bin/touch /etc/puppet/hiera.yaml')
      shell('puppet module install puppetlabs-stdlib --version 2.2.1', { :acceptable_exit_codes => [0,1] })
    end
  end
end