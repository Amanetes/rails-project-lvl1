# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag_name, options = {})
      tag_attributes = options.map { |key, value| " #{key}='#{value}'" }.join
      opening_tag = "<#{tag_name}#{tag_attributes}>"
      closing_tag = "</#{tag_name}>"

      mapping = {
        paired: %w[div label form span p],
        unpaired: %w[br hr img input]
      }
      mapping[:paired].include?(tag_name) ? "#{opening_tag}#{yield if block_given?}#{closing_tag}" : opening_tag
    end
  end
end
