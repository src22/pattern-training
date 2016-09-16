require 'test/unit'
require_relative 'model'
require_relative 'training_parser'

class TrainingTest < Test::Unit::TestCase
  def test_parse
    parser = TrainingParser.new
    patterns = parser.parseFile "001-demo.dsl"
    assert_equal 3, patterns.length
    assert_true patterns[2].desc.include? "such as classes and methods"
  end
  def test_match_number
    filter = NumberFilter.new
    assert_true filter.match "aaaa 12 aaaa"
    assert_true filter.match "12 aaa aaaa"
    assert_true filter.match "aaa aaaa 1"

    assert_false filter.match "aaaa kk aaaa"
    assert_false filter.match ""
  end
end
