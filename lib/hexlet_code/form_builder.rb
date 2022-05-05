# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  class FormBuilder
    attr_reader :record, :components, :options

    def initialize(record, options = {})
      @record = record
      @options = options
      @components = []
    end

    def input(attribute_name, options = {})
      label = Label.new(attribute_name)
      @components << label.build
    end

    def submit
      @components << Tag.build('input', name: 'commit', type: 'submit', value: 'Save')
    end

    def build
      Tag.build('form', options) { @components.join }
    end
  end
end
