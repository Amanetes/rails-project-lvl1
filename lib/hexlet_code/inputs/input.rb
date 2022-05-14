# frozen_string_literal: true

module HexletCode
  module Inputs
    class Input
      attr_reader :attribute_name, :options, :value

      def initialize(attribute_name, value, options = {})
        @attribute_name = attribute_name
        @value = value
        @options = options
      end

      def build
        default_options = { name: attribute_name,
                            type: 'text',
                            value: value }
        updated_options = default_options.merge(options)
        Tag.build('input', updated_options.except(:as))
      end
    end
  end
end
