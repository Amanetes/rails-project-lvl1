# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :record, :components, :options

    def initialize(record)
      @record = record
      @components = []
    end
  end
end
