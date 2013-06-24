require 'yaml'

class ConfigEnv
  attr_reader :settings, :opt

  def initialize(*arg)
    @opt = arg.first || :test
    @settings = YAML.load_file(File.join("config", "config.yml"))
  end

  def env
    @settings[@opt.to_s]
  end
end
