module NiceResponse
  class ModelResolver

    def initialize(controller)
      self.controller = controller
    end

    def model
      controller_name.classify.constantize
    end

    def symbolized_model
      controller_name.singularize.underscore.to_sym
    end

    private

    attr_accessor :controller

    def controller_name
      controller.class.name.demodulize.sub('Controller', '')
    end

  end
end
