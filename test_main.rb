require 'test/unit'
require_relative 'model'
require_relative 'motor'
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
  def test_weight
    patterns = []
    patterns << Pattern.new("A", 3)
    patterns << Pattern.new("B", 1)
    patterns << Pattern.new("C", 2)
    # 0 1 2 . 0 1
    # 0 0 0 1 2 2
    w = WeightCounter.new
    assert_equal 6, (w.sum patterns)
    assert_equal patterns[0], (w.select patterns, 1)
    assert_equal patterns[0], (w.select patterns, 2)
    assert_equal patterns[1], (w.select patterns, 3)
    assert_equal patterns[2], (w.select patterns, 4)
  end
  def test_builder_raise
    # -----------------------------------------
    assert_raise do
      patterns = []
      patterns << Pattern.new("", 3)
      patterns << Pattern.new("", 1)
      patterns << Pattern.new("", 2)
      # 0 1 2 . 0 1
      # 0 0 0 1 2 2
      w = WeightCounter.new
      assert_equal 0, (w.select patterns, 6)
    end
  end
end
