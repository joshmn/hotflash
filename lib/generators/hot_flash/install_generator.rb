require "rails/generators"

module HotFlash
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(__dir__, "templates")

      def copy_templates
        template "config.rb", "config/initializers/hotflash.rb"
      end
    end
  end
end
