# encoding: utf-8

require 'rubygems'
require 'yaml'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.files.unshift(Dir.glob(File.join(lib_dir_path, "conf/**/*.rb")))
end

class Motion::Project::App
  class << self
    alias_method :build_after_config, :build
    def build platform, options = {}

      # Here's where the magic happens!
      Motion::Conf.new config.rubymotion_env_value
      config.files << 'config.rb'

      build_after_config(platform, options)
    end
  end
end
