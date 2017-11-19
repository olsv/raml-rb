module Raml
  class QueryParameter
    attr_accessor :name, :description, :type, :example, :required,
                  :display_name, :minimum, :default, :maximum, :enum

    def initialize(name)
      @name = name
      @required = false
    end

  end
end
