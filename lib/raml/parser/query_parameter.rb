require 'raml/parser/util'
require 'raml/query_parameter'
require 'raml/errors/unknown_attribute_error'

module Raml
  class Parser
    class QueryParameter
      include Raml::Parser::Util

      BASIC_ATTRIBUTES = %w[description type example required display_name minimum default maximum enum]

      attr_accessor :query_parameter, :attributes

      def parse(name, attributes)
        @query_parameter = Raml::QueryParameter.new(name)

        @attributes = prepare_attributes(attributes)
        parse_attributes(attributes)

        query_parameter
      end

      private

        def parse_attributes(attributes)
          attributes.each do |key, value|
            key = underscore(key)
            case key
            when *BASIC_ATTRIBUTES
              query_parameter.send("#{key}=".to_sym, value)
            else
              raise UnknownAttributeError.new "Unknown query paramter key: #{key}"
            end
          end if attributes
        end

    end
  end
end
