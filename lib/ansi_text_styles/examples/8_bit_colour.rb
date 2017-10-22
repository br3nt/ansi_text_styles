require 'ansi_text_styles'

using AnsiTextStyles::Refinement

puts
puts "Standard and high intensity colours"
puts

# Standard and high intensity colours
(0..15).each do |fg|
  row = (0..15).collect do |bg|
    'xxx'.center(5).style(fg: fg, bg: bg)
  end
  puts row.join
end

puts
puts "216 colours"
puts

# 216 colours
colours = (16..231).collect do |bg|
  fg = (bg - 16) % 36 < 18 ? 15 : 0
  bg.to_s.center(5).style(fg: fg, bg: bg)
end

colours.each_slice(36).collect do |row|
  puts row.join
end

puts
puts "Greyscale colours"
puts

# Greyscale colours
colours = (232..255).collect do |bg|
  fg = (bg - 16) % 24 < 12 ? 15 : 0
  bg.to_s.center(5).style(fg: fg, bg: bg)
end

colours.each_slice(12) do |row|
  puts row.join
end
