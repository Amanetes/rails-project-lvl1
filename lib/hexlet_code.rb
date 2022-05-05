# frozen_string_literal: true

require_relative 'hexlet_code/version'


module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Label, 'hexlet_code/label.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')

  class Error < StandardError; end

  def self.form_for(record, options = {})
    options[:action] = options.fetch(:action, '#')
    options[:method] = options.fetch(:method, 'post')
    form = FormBuilder.new(record, options)
    yield(form) if block_given?
    form.build
    end
end
