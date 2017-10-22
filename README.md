# AnsiTextStyles

This gem adds methods to apply ANSI colour codes and text styles to strings through the use of [Refinements][1].

When you want to output colourized or stylized text to the console, use this gem.

# Usage

In your `Gemfile` add `gem 'ansi_text_styles'`.

In your codebase add `require 'ansi_text_styles'`.

The refinement methods in the gem can be used by including `using AnsiTextStyles` in the file, **class** definition, or **module** definition in which you wish to use the [refinement][1].

# Examples

As this gem makes use of [Refinements][1], some of the below examples will not work if copied and pasted directly into IRB or Pry.
This is due to the lexical scoping of refinements.  A nice writeup by James Adam can be found on his blog, [interblah.net][2].

Instead, you can require the example files which are included in the gem.
Eg `require 'ansi_text_styles/examples/basic'`.

## Using the `style` method

```ruby
# require 'ansi_text_styles/examples/basic'

using AnsiTextStyles

puts "How are you?".style(:blue, :bold) + " " + 'I am good!'.style(:red, :bold)
puts '%s %s' % ["How are you?".style(:blue, :bold), 'I am good!'.style(:red, :bold)]
```

## Using chainable methods

```ruby
# require 'ansi_text_styles/examples/chainable'

using AnsiTextStyles

puts 'How are you?'.blue.bold + " " + 'I am good!'.red.bold
puts '%s %s' % ["How are you?".blue.bold, 'I am good!'.red.bold]
```

## Using stored style attributes to apply to a String later:

```ruby
# require 'ansi_text_styles/examples/stored_styles'

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
```

## A Logger with colourised output

```ruby
# require 'ansi_text_styles/examples/logger.rb'

# Note: The String class is only modified within the lexical scope of the class

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
```

## 8-bit (256) colours

Foreground and background colour can be applied using 8-bit colour codes (0 - 255).

```ruby
# require 'ansi_text_styles/examples/8_bit_colour'

using AnsiTextStyles

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
```

## True colour

```ruby
# require 'ansi_text_styles/examples/true_colour'

using AnsiTextStyles

puts 'Foreground using RGB array'.style(fg: [123, 6, 88])
puts 'Foreground using RGB hash'.style(fg: { r: 5, g: 67, b: 145})

puts 'Background using RGB array'.style(bg: [6, 200, 56])
puts 'Background using RGB hash'.style(bg: { red: 56, green: 99, blue: 240})


puts 'Foreground and Background using RGB array'.style(fg: [250, 200, 4], bg: [6, 7, 245])
puts 'Foreground and Background using RGB hash'.style(fg: { red: 70, green: 222, blue: 9}, bg: { r: 200, g: 8, b: 0})
```

# Built-in Styles

## Properties
Style | Method | Style Code
----- | ------ | ----------
No Style | `none` | `0`
Bold | `bold` | `1`
Bright (increased intensity) | `bright` | `1`
Faint (decreased intensity) | `faint` | `2`
Italic | `italic` | `3`
Underline | `underline` | `4`
Blink (slow) | `blink` | `5`
Blink (slow) | `blink_slow` | `5`
Blink (fast) | `blink_fast` | `6`
Swap background and foreground colours | `reverse` | `7`
Hide (foreground colour same as background) | `hide` | `8`
Crossed out | `crossed_out` | `9`

## Colours
Colour | Foreground Method | Fg Code | Background Method | Bg Code
------ | ----------------- | ------- | ----------------- | -------
Default | `default_fg` | `39` | `default_bg` | `49`
Black | `black` | `30` | `bg_black` | `40`
Grey | `grey` | `90` | `bg_grey` | `100`
Light Grey | `lt_grey` | `37` | `bg_lt_grey` | `47`
White | `white` | `97` | `bg_white` | `107`
Red | `red` | `31` | `bg_red` | `41`
Light Red | `lt_red` | `91` | `bg_lt_red` | `101`
Green | `green` | `32` | `bg_green` | `42`
Light Green | `lt_green` | `92` | `bg_lt_green` | `102`
Light Yellow | `dk_yellow` | `33` | `bg_dk_yellow` | `43`
Brown | `brown` | `33` | `bg_dk_brown` | `43`
Yellow | `yellow` | `93` | `bg_yellow` | `103`
Blue | `blue` | `34` | `bg_blue` | `44`
Light Blue | `lt_blue` | `94` | `bg_lt_blue` | `104`
Magenta | `magenta` | `35` | `bg_magenta` | `45`
Light Magenta | `lt_magenta` | `95` | `bg_lt_magenta` | `105`
Pink | `pink` | `95` | `bg_pink` | `105`
Cyan | `cyan` | `36` | `bg_cyan` | `46`
Light Cyan | `lt_cyan` | `96` | `bg_lt_cyan` | `106`
Default colour | `default_fg` | `39` | `default_bg` | `49`


## Compatibility

Because this gem makes use of [refinements][1], it is only compatible with Ruby version 2.0.0 and above (excluding any future release of Ruby 3).

[1]: https://ruby-doc.org/core-2.4.0/doc/syntax/refinements_rdoc.html
[2]: http://interblah.net/why-is-nobody-using-refinements
