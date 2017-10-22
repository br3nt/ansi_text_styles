require 'ansi_text_styles'

using AnsiTextStyles

puts 'How are you?'.blue.bold + " " + 'I am good!'.red.bold
puts '%s %s' % ["How are you?".blue.bold, 'I am good!'.red.bold]
