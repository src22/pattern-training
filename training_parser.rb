
require_relative 'model'

class  TrainingParser
  def initialize
    @patterns = []
  end
  def load_model fileName, statFileName
    parseFile fileName
    parseFile statFileName if File.file?(statFileName)
    return @patterns
  end
  def parseFile fileName
    input = File.readlines(fileName)
    input.each do |line|
      process_line line
    end
    return @patterns
  end
  def process_line line
    if line.start_with? "#"
      name = line[1..-1]
      @actPattern = @patterns.detect { |p| p.name == name }
      if (@actPattern==nil)
        @actPattern = Pattern.new( name )
        @patterns << @actPattern
      end
    elsif line.start_with? "difficulty"
      @actPattern.stat.difficulty = extract_number_but_zero(line)
    else
      @actPattern.desc += line  unless line.to_s.strip.length == 0
    end
  end
  def extract_number_but_zero line
    number = line[/\d+/].to_i
    return 1 if (number==0)
    return number
  end
  def save_stats patterns, fileName
    File.open(fileName, 'w') do |file|
      patterns.each do |p|
        write_stat file, p
      end
    end
  end
  def write_stat file, p
    return if (p.stat.difficulty<=1)
    puts ""
    puts "" + p.name
    puts "difficulty " + p.stat.difficulty.to_s
    line = "#"+p.name
    line += "\n" unless line.end_with?( "\n" )
    file.write(line)
    file.write("difficulty "+p.stat.difficulty.to_s+"\n\n")
  end
end
class NumberFilter
  def initialize(min,max)
    @min = min
    @max = max
  end
  def filter patterns
    output = []
    patterns.each do |pattern|
      output << pattern if filter_pattern (pattern)
    end
    return output
  end
  def filter_pattern pattern
    return match(pattern.name)
  end
  def match name
    value = name[/\d+/].to_i
    return  (value != 0) && (value > @min-1) && (value < @max+1)
  end
end
