$LOAD_PATH << File.join(__dir__, '..', 'lib')
require 'minitest/autorun'
require 'rake'
require 'tempfile'
require 'bundler/gem_helper'
require 'bundler/gem_helper/push_host_key'


class TestPushHostKey < Minitest::Test
  def setup
    @orig_path = ENV['PATH']
    ENV['PATH'] = File.join(__dir__, 'bin')

    Tempfile.new.tap { |t| @gem_commandline_path = t.path }.close
    ENV['GEM_COMMANDLINE'] = @gem_commandline_path
  end

  def teardown
    Rake.application = nil
    Bundler::GemHelper.instance = nil
    ENV['PATH'] = @orig_path
    ENV['GEM_COMMANDLINE'] = nil
    File.unlink(@gem_commandline_path)
  end

  def gem_commandline
    File.read(@gem_commandline_path).strip
  end

  def push_testgem(name)
    Bundler::GemHelper.install_tasks(dir: File.join(__dir__, 'gem'), name: name)
    Bundler.ui = nil

    Rake::Task['release:rubygem_push'].reenable
    Rake::Task['release:rubygem_push'].execute
  end

  def test_push_to_custom_host
    push_testgem('example-net-allowed')
    assert_includes(gem_commandline, '--key example.net')
    assert_includes(gem_commandline, '--host http://example.net')
  end

  def test_push_to_rubygems
    push_testgem('all-allowed')

    refute_includes(gem_commandline, '--host')
    refute_includes(gem_commandline, '--key')
  end
end
