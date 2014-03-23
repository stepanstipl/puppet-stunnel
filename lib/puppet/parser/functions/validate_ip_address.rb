module Puppet::Parser::Functions

  newfunction(:validate_ip_address, :doc => <<-ENDHEREDOC
    Validate that all values passed are valid IPv4 or IPV6 address.
    Fail compilation if any value fails this check.

    ENDHEREDOC
  ) do |args|

    args.each do |arg|
      unless arg.is_a?(String)
        raise Puppet::ParseError, "#{arg.inspect} is not a string."
      end

      Puppet::Parser::Functions.autoloader.load(:is_ip_address) \
        unless Puppet::Parser::Functions.autoloader.loaded?(:is_ip_address)

      unless is_ip_address(arg)
        raise Puppet::ParseError, "#{arg.inspect} is not a valid IP address."
      end
    end

  end
end
