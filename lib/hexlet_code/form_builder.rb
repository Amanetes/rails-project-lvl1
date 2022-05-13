# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  autoload(:TextArea, 'hexlet_code/textarea.rb')
  autoload(:Form, 'hexlet_code/form.rb')
  class FormBuilder
    attr_reader :record, :form, :options

    def initialize(form, record, options = {})
      @record = record
      @form = form
      @options = options
    end

    def make_label(attribute_name)
      label = Label.new(attribute_name)
      form.components << label.build
    end

    def input(attribute_name, options = {})
      make_label(attribute_name)
      value = @record.public_send(attribute_name)
      mapping = {
        input: -> { Input.new(attribute_name, value, options) },
        text: -> { TextArea.new(attribute_name, value, options) }
      }
      type = options[:as] || :input
      form.components << mapping[type].call.build
    end

    def submit(value = 'Save')
      form.components << Tag.build('input', name: 'commit', type: 'submit', value: value)
    end

    def build
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')
      other = options.except(:method, :url)
      Tag.build('form', action: action, method: method, **other) { form.components.join }
    end
  end
end
