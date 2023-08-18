require "hot_flash/version"
require "hot_flash/railtie"
require 'hot_flash/controller'

module HotFlash
  class Configuration
    attr_accessor :turbo_action
    attr_accessor :turbo_target
    attr_accessor :flash_method

    def initialize
      @turbo_action = "replace"
      @turbo_target = "#flashes"
      @flash_method = :render_flash
    end
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
