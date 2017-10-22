require 'ansi_text_styles'

class ColourLogger
  using AnsiTextStyles

  def self.status(text)
  "[#{text}]".ljust(7)
  end

  def self.log_msg(status_text, message)
  "%s %s" % [status(status_text), message]
  end

  def self.log_info(message)
  log_msg('INFO'.green, message)
  end

  def self.log_error(message)
  log_msg('ERROR'.red, message)
  end
end

puts ColourLogger.log_info('a pretty colourised info message')
puts ColourLogger.log_error('a pretty colourised error message')
