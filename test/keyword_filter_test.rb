require "test_helper"

class KeywordFilterTest < Minitest::Test

  def setup
    KeywordFilter.add('加微信', '加威杏', '加薇信')
  end

  def teardown
    KeywordFilter.clear
  end

  def test_that_it_has_a_version_number
    refute_nil ::KeywordFilter::VERSION
  end

  def test_filter
    result = KeywordFilter.filter("加加/-】 微信信")
    assert result
    assert_equal '加微信', KeywordFilter.filtered_words.join

    result = KeywordFilter.filter("微信")
    assert !result
  end
end
