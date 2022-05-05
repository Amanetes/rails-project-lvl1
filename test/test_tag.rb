# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_paired_tags
    acutal = HexletCode::Tag.build('div')
    assert_equal('<div></div>', acutal)
  end

  def test_unpaired_tags
    actual = HexletCode::Tag.build('br')
    assert_equal('<br>', actual)
  end

  def test_content_tags
    actual = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal('<label for="email">Email</label>', actual)
  end
end
