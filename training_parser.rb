
require_relative 'model'

class  TrainingParser

  def initialize
    @patterns = []
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
      @patterns << Pattern.new( line[1..-1] )
    else
      @patterns.last.desc += line + "\n" unless line.to_s.strip.length == 0
    end
  end
end
