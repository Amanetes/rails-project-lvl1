# frozen_string_literal: true

module HexletCode
  class Label
    attr_reader :attribute_name, :options

    def initialize(attribute_name)
      @attribute_name = attribute_name
      @options = { for: attribute_name }
    end

    def build
      Tag.build('label', @options) { @options[:for].capitalize }
    end
  end
end
