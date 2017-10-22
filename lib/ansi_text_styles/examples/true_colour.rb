require 'ansi_text_styles'

using AnsiTextStyles

# String.include AnsiTextStyles
puts 'Foreground using RGB array'.style(fg: [123, 6, 88])
puts 'Foreground using RGB hash'.style(fg: { r: 5, g: 67, b: 145})

puts 'Background using RGB array'.style(bg: [6, 200, 56])
puts 'Background using RGB hash'.style(bg: { red: 56, green: 99, blue: 240})


puts 'Foreground and Background using RGB array'.style(fg: [250, 200, 4], bg: [6, 7, 245])
puts 'Foreground and Background using RGB hash'.style(fg: { red: 70, green: 222, blue: 9}, bg: { r: 200, g: 8, b: 0})
