require 'ansi_text_styles'

using AnsiTextStyles

puts "How are you?".style(:blue, :bold) + " " + 'I am good!'.style(:red, :bold)
puts '%s %s' % ["How are you?".style(:blue, :bold), 'I am good!'.style(:red, :bold)]
