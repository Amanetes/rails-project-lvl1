# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def self.build(form, options = {})
      method = options.fetch(:method, 'post')
      action = options.fetch(:url, '#')
      other = options.except(:method, :url)
      rendered = form.components.map(&:build)
      Tag.build('form', action: action, method: method, **other) { rendered.join }
    end
  end
end
