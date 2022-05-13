# frozen_string_literal: true

module HexletCode
  autoload(:Input, 'hexlet_code/inputs/input')
  autoload(:TextArea, 'hexlet_code/inputs/textarea')
  autoload(:Submit, 'hexlet_code/inputs/submit')
  class Form
    attr_reader :record, :components

    def initialize(record)
      @record = record
      @components = []
    end

    def make_label(attribute_name)
      @components << Label.new(attribute_name)
    end

    def input(attribute_name, options = {})
      make_label(attribute_name)
      value = @record.public_send(attribute_name)
      type = options[:as] || :string
      mapping = {
        string: -> { Input.new(attribute_name, value, options) },
        text: -> { TextArea.new(attribute_name, value, options) }
      }
      @components << mapping[type].call
    end

    def submit(value = 'Save')
      @components << Submit.new('commit', value, type: 'submit')
    end
  end
end
