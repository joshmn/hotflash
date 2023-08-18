module HotFlash
  class Action
    def initialize(controller)
      @controller = controller
      @enabled = false
      @turbo_action = HotFlash.config.turbo_action
      @turbo_target = HotFlash.config.turbo_target
      @flash_method = HotFlash.config.flash_method
    end

    def enable!
      @enabled = true
    end

    def disable!
      @enabled = false
    end

    def enabled?
      @enabled
    end

    def render
      @controller.view_context.turbo_stream_action_tag(turbo_action, targets: turbo_target, template: content)
    end

    def turbo_action
      @turbo_action
    end

    def turbo_target
      @turbo_target
    end

    def render_into(render_args)
      return render_args unless render?(render_args)

      render_args[0][:turbo_stream] << render
      render_args
    end

    def render?(render_args)
      return false unless enabled?
      return false unless render_args[0] && render_args[0][:turbo_stream]

      true
    end

    def content
      if @controller.respond_to?(@flash_method)
        return @controller.send(@flash_method)
      elsif @controller.helpers.respond_to?(@flash_method)
        return @controller.helpers.send(@flash_method)
      else
        raise NoMethodError, "#{@controller.class.name} doesn't respond to #{@flash_method}"
      end
    end
  end
end
