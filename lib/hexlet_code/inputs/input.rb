# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :attribute_name, :options, :value

    def initialize(attribute_name, value, options = {})
      @attribute_name = attribute_name
      @value = value
      @options = options
    end

    def build
      Tag.build('input', name: attribute_name, type: 'text', value: value)
    end
  end
end
