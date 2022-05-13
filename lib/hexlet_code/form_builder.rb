# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  autoload(:TextArea, 'hexlet_code/textarea.rb')
  autoload(:Form, 'hexlet_code/form.rb')
  class FormBuilder
    def self.build(form, options = {})
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')
      other = options.except(:method, :url)
      Tag.build('form', action: action, method: method, **other) { form.components.join }
    end
  end
end
