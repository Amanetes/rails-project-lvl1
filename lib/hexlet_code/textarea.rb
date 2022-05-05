# frozen_string_literal: true

module HexletCode
  class TextArea
    attr_reader :attribute_name, :value, :options

    def initialize(attribute_name, value, options = {})
      @attribute_name = attribute_name
      @value = value
      @options = options
    end

    def build(name)
      default_options = { cols: options.fetch(:cols, '20'),
                          rows: options.fetch(:rows, '40'),
                          name: }
      updated_options = default_options.merge(options)
      Tag.build('textarea', updated_options.except(:as)) { value }
    end
  end
end
