# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :record, :components

    def initialize(record)
      @record = record
      @components = []
    end

    def add_label(attribute_name)
      @components << Label.new(attribute_name)
    end

    def input(attribute_name, options = {})
      add_label(attribute_name)
      value = @record.public_send(attribute_name)
      type = options[:as] || :input
      input_class = type.to_s.capitalize
      @components << begin
        Inputs.const_get(input_class).new(attribute_name, value, options)
      rescue StandardError
        raise "Input #{input_class} is not supported"
      end
    end

    def submit(value = 'Save')
      @components << Inputs::Submit.new('commit', value, type: 'submit')
    end
  end
end
