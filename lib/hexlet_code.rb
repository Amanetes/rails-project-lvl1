# frozen_string_literal: true

require_relative 'hexlet_code/version'


module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Error < StandardError; end

  def self.form_for(record, options = {}, &block)
    Tag.build('form', { action: '#', method: 'post' })
  end
end
