require 'test/unit'
require_relative 'model'
require_relative 'motor'
require_relative 'training_parser'

class TrainingTest < Test::Unit::TestCase
  def test_extract_number_but_zero
    parser = TrainingParser.new
    assert_equal 18, parser.extract_number_but_zero("aaa 18")
    assert_equal 1, parser.extract_number_but_zero("aaa")
    assert_equal 1, parser.extract_number_but_zero("aaa 0")
  end
  def test_parse
    parser = TrainingParser.new
    patterns = parser.load_model "001-demo.dsl", "001-demo-stat.dsl"
    assert_equal 3, patterns.length
    assert_true patterns[2].desc.include? "such as classes and methods"

    assert_equal 1, patterns[0].stat.difficulty
    assert_equal 3, patterns[1].stat.difficulty
    assert_equal 2, patterns[2].stat.difficulty
  end
  def test_save_stats
    # save a random weight
    value = rand(100)
    patterns = []
    patterns << Pattern.new("DEMO - Alternative Tokenization", value)
    TrainingParser.new.save_stats(patterns, "001-demo-stat-2.dsl")
    # load it
    loaded = TrainingParser.new.load_model "001-demo.dsl", "001-demo-stat-2.dsl"
    # and check
    assert_equal value, loaded[1].stat.difficulty
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
