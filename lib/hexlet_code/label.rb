# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Label
    attr_reader :attribute_name, :options

    def initialize(attribute_name)
      @attribute_name = attribute_name
      @options = { for: attribute_name }
    end

    def build
      "\n#{Tag.build('label', options) { options[:for].capitalize }}\n"
    end
  end
end
