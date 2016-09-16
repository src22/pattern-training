
class Stat
  attr_accessor :easyness
  def initialize
    @easyness = 0
  end
end

class Pattern
  attr_accessor :name, :desc, :stat
  def initialize name
    @name = name
    @desc = ""
    @stat = Stat.new
  end
end
