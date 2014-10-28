module Motion
  class Conf

    def initialize(rm_env)
      environment = determine_environment(rm_env)

      if environment
        filename = "config.#{environment}.yml"

        unless File.exists?(filename)
          puts "No configuration file found for #{environment}. Creating file: #{filename}."
          File.open(filename, "w") {}
        end

        puts "Using configuration from #{filename}."
        file = File.read(filename)
        ConfigBuilder.new(file).create_configuration(environment)
      else
        puts "Unable to determine your RubyMotion environment."
      end
    end

    def determine_environment(rm_env)
      if self.respond_to?(:hockeyapp?)
        rm_env = "hockeyapp" if self.hockeyapp?
      end

      if self.respond_to?(:testflight?)
        rm_env = "testflight" if self.testflight?
      end

      rm_env
    end
  end

  class ConfigBuilder
    attr_accessor :yaml, :environment

    def initialize(file)
      @yaml = YAML.load(file)
    end

    def create_configuration(environment)
      if @yaml.nil? || @yaml == false
        puts "Your configuration file is blank. Skipping configuration file generation."
        return
      end

      code = <<END_OF_STRING
module MotionConf
  module_function

END_OF_STRING

      yaml.each do |key, value|
        if value.is_a?(String)
          code +=  "  def #{key}; \"#{value}\"; end;\n"
        else
          code +=  "  def #{key}; #{value}; end;\n"
        end
      end

      code += <<END_OF_STRING
end
END_OF_STRING

      File.open("config.rb", 'w') do |f|
        f.write(code)
      end
    end
  end

end
