# frozen_string_literal: true

module HexletCode
  class Tag
    PAIRED_TAGS = %w[div label form span p textarea].freeze
    UNPAIRED_TAGS = %w[br hr img input].freeze
    SUPPORTED_TAGS = PAIRED_TAGS.union(UNPAIRED_TAGS).freeze
    def self.build(tag_name, options = {})
      raise ::HexletCode::Error, "Tag: #{tag_name} is not supported" unless SUPPORTED_TAGS.include?(tag_name)

      tag_attributes = options.map { |key, value| %(#{key}="#{value}") unless value.nil? }.compact.join(' ')

      opening_tag = tag_attributes.empty? ? "<#{tag_name}>" : "<#{tag_name} #{tag_attributes}>"
      closing_tag = "</#{tag_name}>"

      PAIRED_TAGS.include?(tag_name) ? "#{opening_tag}#{yield if block_given?}#{closing_tag}" : opening_tag
    end
  end
end
