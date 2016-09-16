require 'test/unit'
require_relative 'model'
require_relative 'training_parser'

class TrainingTest < Test::Unit::TestCase
  def test_parse
    parser = TrainingParser.new
    patterns = parser.parseFile "001-demo.dsl"
    assert_equal 3, patterns.length
    assert_true patterns[2].desc.include? "plus one line"
  end
end
