
class Stat
  attr_accessor :difficulty
  def initialize
    @difficulty = 1
  end
  def decrease
    @difficulty = @difficulty-1 if @difficulty>1
  end
  def increase
    @difficulty = @difficulty+1
  end
end

class Pattern
  attr_accessor :name, :desc, :stat
  def initialize name, difficulty = 1
    @name = name
    @desc = ""
    @stat = Stat.new
    @stat.difficulty = difficulty
  end
end
