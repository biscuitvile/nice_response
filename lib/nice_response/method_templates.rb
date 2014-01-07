module NiceResponse
  module MethodTemplates

    def index_method_template
      respond_with resolved_model.all
    end

    def show_method_template
      respond_with resolved_model.find(params[:id])
    end

    def create_method_template
      respond_with resolved_model.create(permitted_params)
    end

    def update_method_template
      respond_with resolved_model.update(params[:id], permitted_params)
    end

    def destroy_method_template
      respond_with resolved_model.find(params[:id]).destroy
    end

  end
end
