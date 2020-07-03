require 'bundler/gem_helper'
require 'bundler_push_host_key'

Bundler::GemHelper.prepend(BundlerPushHostKey)
