# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:Input, 'hexlet_code/input.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:TextArea, 'hexlet_code/textarea.rb')
  autoload(:Form, 'hexlet_code/form.rb')

  class Error < StandardError; end

  def self.form_for(record, options = {})
    form = Form.new(record)
    rendered_form = FormBuilder.new(form, record, options)
    yield(rendered_form) if block_given?
    rendered_form.build
  end
end
