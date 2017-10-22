require 'ansi_text_styles'

using AnsiTextStyles

text_styles = {
    red_bold:       [:red, :bold],
    blue_underline: [:blue, :underline],
    pretty:         [:bg_magenta, :blink],
  }

text_styles.each do |name, style|
  styled_text = "Text styled multiple ways".style(style)
  puts "%s: %s" % [name, styled_text]
end
