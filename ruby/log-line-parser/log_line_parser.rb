class LogLineParser
  def initialize(line)
    @line = line
    @colon_position = @line.index(':')
    @size_of_string = @line.size
  end

  def message
    @line[@colon_position + 1, @size_of_string].strip
  end

  def log_level
    level = @line[0, @colon_position -1].scan(/\w+/)
    level[0].downcase
  end

  def reformat
    message = @line[@colon_position + 1, @size_of_string].strip
    levels = @line[0, @colon_position -1].scan(/\w+/)
    level = levels[0].downcase
    "#{message} (#{level})"
  end
end
