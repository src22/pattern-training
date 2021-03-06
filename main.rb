require_relative 'model'
require_relative 'motor'
require_relative 'training_parser'

class Training
  def initialize
    @roundMax = 20
    @model_file_name = "002-all.dsl"
    @stat_file_name = "002-all-stat.dsl"
    @pattern_number_minimum = 10
    @pattern_number_maximum = 20
    @history = []
    @patterns = []
  end
  def main
    @patterns = TrainingParser.new.load_model @model_file_name, @stat_file_name
    filter = NumberFilter.new(@pattern_number_minimum,@pattern_number_maximum)
    @patterns = filter.filter @patterns
    train
    print_title "The Training finished"
  end
  def train
    for @i in 1..@roundMax
      s = do_a_round
      break if s.include? "x"
    end
    TrainingParser.new.save_stats @patterns, @stat_file_name
  end
  def do_a_round
    clear_screen
    print_title "The Training starts now..." if @i==1
    print_title "[#{@i}/#{@roundMax}]"

    pattern = WeightCounter.new.select_random @history, @patterns

	puts ""
	puts ""
	puts ""
    puts "      "+pattern.name
    s = gets
    puts "      "
    puts add_spaces(pattern.desc)
    s = get_user_response
    changeDifficulty pattern, s

    # puts "<"+s+">"
    # puts " difficulty " + pattern.stat.difficulty.to_s
    # alma = gets

    return s
  end
  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
  def add_spaces arg 	
	return "\n      " + arg.gsub("\n","\n\n      ")
  end
  def print_title arg
    puts ""
    puts "      "
    puts "      " + arg
    puts "      "
  end
  def get_user_response
    s = gets
    puts ""
    puts ""
    puts ""
    puts ""
    puts "      --------------------------"
    puts "       1 - it was too easy "
    puts "       2 - it was ok "
    puts "       3 - it was hard "
    puts "       x - exit "
    puts ""
    s = gets
    return s
  end
  def changeDifficulty pattern, s
    pattern.stat.descrease if 1==s.to_i
    pattern.stat.increase if 3==s.to_i
  end
end

# the main --------------------
t = Training.new
t.main
