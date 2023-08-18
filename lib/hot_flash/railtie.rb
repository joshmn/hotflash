module HotFlash
  class Railtie < ::Rails::Railtie
    initializer "hotflash.initialize" do
      ActiveSupport.on_load(:action_controller_base) do
        ActionController::Base.send(:include, HotFlash::Controller)
      end
    end
  end
end

