# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  autoload(:TextArea, 'hexlet_code/textarea.rb')
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
      value = @record.public_send(attribute_name)
      input = Input.new(attribute_name, value, options)
      textarea = TextArea.new(attribute_name, value, options)
      @components << if options[:as] == :text
                       textarea.build
                     else
                       input.build
                     end
    end

    def submit(value = 'Save')
      @components << "\n#{Tag.build('input', name: 'commit', type: 'submit', value: value)}\n"
    end

    def build
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')
      other = options.except(:method, :url)
      Tag.build('form', action: action, method: method, **other) { @components.join }
    end
  end
end
