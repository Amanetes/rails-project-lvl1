# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :record, :components

    def initialize(record)
      @record = record
      @components = []
    end

    def make_label(attribute_name)
      label = Label.new(attribute_name)
      @components << label.build
    end

    def input(attribute_name, options = {})
      make_label(attribute_name)
      value = @record.public_send(attribute_name)
      mapping = {
        input: -> { Input.new(attribute_name, value, options) },
        text: -> { TextArea.new(attribute_name, value, options) }
      }
      type = options[:as] || :input
      @components << mapping[type].call.build
    end

    def submit(value = 'Save')
      @components << Tag.build('input', name: 'commit', type: 'submit', value: value)
    end
  end
end
