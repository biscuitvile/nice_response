module NiceResponse
  class NamespaceResolver

    def initialize(controller)
      self.controller = controller
    end

    def namespaces
      controller.class.name.split('::').delete_if do |str|
        str.include?('Controller')
      end.map { |str| str.downcase.to_sym }
    end

    private

    attr_accessor :controller

  end
end
