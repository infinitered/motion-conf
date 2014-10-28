# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './motion/motion-conf'
require './motion/conf/motion-conf'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-conf'
end
