# -*- encoding: utf-8 -*-
$:.push File.expand_path('../motion', __FILE__)

VERSION = "1.0"

Gem::Specification.new do |spec|
  spec.name          = "motion-conf"
  spec.version       = VERSION
  spec.authors       = ["Mark Rickert", "Will Raxworthy"]
  spec.email         = ["mjar81@gmail.com", 'will@willrax.com']
  spec.description   = "motion-conf is an easy to use configuration class generator for your RubyMotion apps. It uses YAML files to statically generate a MotionConf class with each option in the yaml file defined for easy access.

It uses the RubyMotion environment variable to determine which YAML file to compile into your class."
  spec.summary       = "motion-conf is an easy to use configuration class generator for your RubyMotion apps."
  spec.homepage      = ""
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('motion/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["motion"]

  spec.add_development_dependency 'rake'
end
