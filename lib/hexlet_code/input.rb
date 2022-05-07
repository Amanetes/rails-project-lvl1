# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Input
    attr_reader :attribute_name, :options, :value

    def initialize(attribute_name, value, options = {})
      @attribute_name = attribute_name
      @value = value
      @options = options
    end

    def build(name)
      Tag.build('input', name: name, type: 'text', value: value)
    end
  end
end
