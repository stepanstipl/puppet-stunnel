module Puppet::Parser::Functions

  newfunction(:validate_host_service, :doc => <<-ENDHEREDOC
    Validate that first argument passed is valid comnination of host (ip) and port (service).
    2nd option arguments signifies whether the port part is required (defaults to true)
    Fail compilation if any value fails this check.

    ENDHEREDOC
  ) do |args|

    if (args.length < 1) or (args.length > 2) then
      raise Puppet::ParseError, ("validate_host_service(): wrong number of arguments (#{args.length}; must be 1 or 2)")
    end

    unless (args[1] == true || args[1] == false) then
      raise Puppet::ParseError, ("#{arg[1].inspect} is not a boolean.  It looks to be a #{arg[1].class}")
    end

    require_port = args[1] || true

    if match /^(.*):(.*)$/.match(args[0]) then
      host = match[1]
      service = match[2]
    else
      if require_port then
        raise Puppet::ParseError, ("#{arg[0].inspect} doesn't seem to be in form host:service.")
      end
      host = args[0]
    end

    Puppet::Parser::Functions.autoloader.load(:validate_host) \
      unless Puppet::Parser::Functions.autoloader.loaded?(:validate_host) 

    Puppet::Parser::Functions.autoloader.load(:validate_service) \
      unless Puppet::Parser::Functions.autoloader.loaded?(:validate_service) 

    validate_host(host)
    if service then
      validate_service(service)
    end

  end
end
