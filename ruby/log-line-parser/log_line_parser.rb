# frozen_string_literal: true
class LogLineParser # rubocop:disable Style/Documentation
  attr_reader :message, :log_level

  def initialize(line)
    level, line = line.split(':')
    @message = line.strip
    @log_level = level.gsub(/\[|\]/, '').downcase
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
