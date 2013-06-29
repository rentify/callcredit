require 'yaml'

class ConfigEnv
  attr_reader :settings, :opt

  def initialize(*arg)
    @opt = arg.first || :test
    path = File.join(File.dirname(__FILE__), "..", "..", "config", "config.yml")
    @settings = YAML.load_file path
  end

  def env
    @settings[@opt.to_s]
  end
end
