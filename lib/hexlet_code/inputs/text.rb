# frozen_string_literal: true

module HexletCode
  module Inputs
    class Text
      attr_reader :attribute_name, :value, :options

      COLS = '20'
      ROWS = '40'
      def initialize(attribute_name, value, options = {})
        @attribute_name = attribute_name
        @value = value
        @options = options
        @options[:cols] ||= COLS
        @options[:rows] ||= ROWS
      end

      def build
        default_options = { cols: options[:cols],
                            rows: options[:rows],
                            name: attribute_name }
        updated_options = default_options.merge(options)
        Tag.build('textarea', updated_options.except(:as)) { value }
      end
    end
  end
end
