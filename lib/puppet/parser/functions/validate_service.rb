module Puppet::Parser::Functions

  newfunction(:validate_service, :doc => <<-ENDHEREDOC
    Validate that all values passed are port numbers or acceptable service names.
    Fail compilation if any value fails this check.

    ENDHEREDOC
  ) do |args|

    unless args.length > 0 then
    raise Puppet::ParseError, ("validate_service(): wrong number of arguments (#{args.length}; must be > 0)")
    end

    args.each do |arg|
      unless ( arg.is_a?(String) or arg.is_a?(Integer) )
        raise Puppet::ParseError, "#{arg.inspect} is not a string nor integer."
      end

      unless ( arg.is_a?(Integer) or /^[a-zA-Z0-9][a-zA-Z0-9-]*$/.match($arg) ) 
        raise Puppet::ParseError, "#{arg.inspect} does not seem to be valid port number nor service name"
      end

    end

  end
end
