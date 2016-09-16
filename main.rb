require_relative 'model'
require_relative 'training_parser'

class Training
  def initialize
    @roundMax = 3
  end
  def main
    parser = TrainingParser.new
    @patterns = parser.parseFile "001-demo.dsl"
    train
    print_title "The Training finished"
  end
  def train
    for @i in 1..@roundMax
      s = do_a_round
      return if s.include? "x"
    end
  end
  def do_a_round
    clear_screen
    print_title "The Training starts now..." if @i==1
    print_title "Round #{@i}/#{@roundMax}"
    pattern = @patterns[rand(@patterns.length)]
    puts pattern.name
    s = gets
    puts "--------------------------"
    puts pattern.desc
    s = get_user_response
    return s
  end
  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
  def print_title arg
    puts ""
    puts "--------------------------"
    puts arg
    puts "--------------------------"
  end
  def get_user_response
    s = gets
    puts ""
    puts ""
    puts ""
    puts ""
    puts "--------------------------"
    puts " 1 - it was too easy "
    puts " 2 - it was ok "
    puts " 3 - it was hard "
    puts " x - exit "
    puts ""
    s = gets
    return s
  end
end

# the main --------------------
t = Training.new
t.main
