# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:Form, 'hexlet_code/form')
  autoload(:Inputs, 'hexlet_code/inputs')
  autoload(:Label, 'hexlet_code/label')
  autoload(:Submit, 'hexlet_code/inputs/submit')

  class Error < StandardError; end

  def self.form_for(record, options = {})
    form = Form.new(record)
    yield(form) if block_given?
    FormBuilder.build(form, options)
  end
end
