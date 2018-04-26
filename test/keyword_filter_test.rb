require "test_helper"

class KeywordFilterTest < Minitest::Test

  def setup
    KeywordFilter.add('加微信', '交易', '微信交易吗')
  end

  def teardown
    KeywordFilter.dict.clear
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
    result = KeywordFilter.filter("交")
    assert !result

    result = KeywordFilter.filter("微信交易号")
    assert result
  end
end
