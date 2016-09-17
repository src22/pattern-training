
class WeightCounter
  def sum patterns
    sum = 0
    patterns.each do |pattern|
      sum += pattern.stat.difficulty
    end
    return sum
  end
  def select patterns, number
    sum = 0
    patterns.each do |pattern|
      sum += pattern.stat.difficulty
      return pattern if sum > number
    end
    throw "WeightCounter overweighted..."
  end
end
