# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end
  User = Struct.new(:name, :job, keyword_init: true)
  def test_form_for
    user = User.new(name: 'Rob')
    actual = HexletCode.form_for(user) { |f| }
    assert_equal("<form action='#' method='post'></form>", actual)
  end
end
