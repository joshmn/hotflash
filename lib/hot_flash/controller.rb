require 'hot_flash/action'

module HotFlash
  module Controller
    extend ActiveSupport::Concern

    def render(*args)
      args = hotflash.render_into(args)

      super(*args)
    end

    class_methods do
      private

      def disable_hotflash(**options)
        before_action :disable_hotflash, **options
      end

      def enable_hotflash(**options)
        before_action :enable_hotflash, **options
      end
    end

    private

    def enable_hotflash
      hotflash.enable!
    end

    def disable_hotflash
      hotflash.disable!
    end

    def hotflash
      @hotflash ||= HotFlash::Action.new(self)
    end
  end
end

