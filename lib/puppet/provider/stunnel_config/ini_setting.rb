Puppet::Type.type(:stunnel_config).provide(
  :ini_setting,
  :parent => Puppet::Type.type(:ini_setting).provider(:ruby)
) do
 
  # hard code the file path (this allows purging)
  def self.file_path
    '/etc/stunnel/stunnel.conf'
  end
end
