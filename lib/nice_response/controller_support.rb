module NiceResponse
  module ControllerSupport

    def self.included(base)
      base.send(:respond_to, :json)
      base.extend ClassMethods
      base.send(:include, NiceResponse::MethodTemplates)
    end

    module ClassMethods

      def actions(*args)
        args.each do |method|
          define_method(method) do
            send "#{method}_method_template"
          end
        end
      end

      def permit(*args)
        self.class_variable_set(:@@permitted_param_names, args)
      end

    end

    private

    def resolved_model
      @resolved_model_class ||= ModelResolver.new(self).model
    end

    def symbolized_model_name
      @symbolized_model_name ||= ModelResolver.new(self).symbolized_model
    end

    def permitted_params
      params.require(symbolized_model_name)
      .permit self.class.class_variable_get(:@@permitted_param_names)
    end

  end
end
