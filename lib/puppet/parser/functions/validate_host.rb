module Puppet::Parser::Functions

  newfunction(:validate_host, :doc => <<-ENDHEREDOC
    Validate that all values passed are valid IPv4 or IPV6 address,
    or hostnames.
    Fail compilation if any value fails this check.

    ENDHEREDOC
  ) do |args|


  unless args.length > 0 then
   raise Puppet::ParseError, ("validate_host(): wrong number of arguments (#{args.length}; must be > 0)")
  end

  args.each do |arg|
    unless arg.is_a?(String)
      raise Puppet::ParseError, "#{arg.inspect} is not a string."
    end

    Puppet::Parser::Functions.autoloader.load(:is_ip_address) \
      unless Puppet::Parser::Functions.autoloader.loaded?(:is_ip_address)

    unless ( is_ip_address($arg) or /^[a-zA-Z0-9][a-zA-Z0-9-]*(\.[a-zA-Z0-9]+)*$/.match($arg) ) then 
      raise Puppet::ParseError, "#{arg.inspect} does not seem to be valid ip address nor hostname."
    end

  end

end
end
