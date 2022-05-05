# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test

  User = Struct.new(:name, :job, keyword_init: true)

  def test_form_for
    user = User.new(name: 'Rob', job: 'hexlet')
    expected_html = File.read('test/fixtures/form.html')
    actual = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal(expected_html, actual)
  end
end
