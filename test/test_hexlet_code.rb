# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_form_for
    user = User.new(name: 'Rob', job: 'hexlet')
    expected_html = File.read('test/fixtures/form1.html')
    actual = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal(expected_html, actual)
  end
end
