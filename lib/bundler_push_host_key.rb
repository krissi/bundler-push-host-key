require 'uri'

module BundlerPushHostKey
  def gem_key
    uri = URI.parse(gem_push_host)
    uri = URI.parse("http://#{gem_push_host}") if uri.host.nil?

    uri.host == 'rubygems.org' ? nil : uri.host
  end
end
