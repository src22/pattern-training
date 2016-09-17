
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
  def select_random history, patterns
    summa = sum( patterns )
    pattern = select patterns, rand(summa)
    index = history.index pattern
    # if it is in history, try again 5 times
    for i in [1..5] do
      if (index != nil)
        pattern = select patterns, rand(summa)
        index = history.index pattern
      end
    end
    # add to history
    history << pattern
    return pattern
  end
end
