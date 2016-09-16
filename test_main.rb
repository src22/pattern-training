require 'test/unit'
require_relative 'model'
require_relative 'training_parser'

class TrainingTest < Test::Unit::TestCase
  def test_parse
    parser = TrainingParser.new
    parser.parseFile "001-demo.dsl"
    puts "test_parse done"
  end
end
