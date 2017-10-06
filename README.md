# AnsiTextStyles

This gem adds methods to apply ANSI colour codes and text styles to strings through the use of [Refinements][1].

When you want to output colourized or stylized text to the console, use this gem.

# Usage

The refinement methods in the gem can be used by including `using AnsiTextStyles` in the file, **class** definition, or **module** definition in which you wish to use the [refinement][1].

# Examples

As this gem makes use of [Refinements][1], some of the below examples will not work if copied and pasted directly into IRB or Pry.
This is due to the lexical scoping of refinements.  A nice writeup by James Adam can be found on his blog, [interblah.net][2].
Instead, you can save the example into a file and run the file with `ruby example.rb`.
These examples will start with the code comment `# example.rb`.

## Using the `style` method

```ruby
# example.rb

using AnsiTextStyles

puts "How are you?".style(:blue, :bold) + " " + 'I am good!'.style(:red, :bold)
puts '%s %s' % ["How are you?".style(:blue, :bold), 'I am good!'.style(:red, :bold)]
```

## Using chainable methods

```ruby
# example.rb

using AnsiTextStyles

puts 'How are you?'.blue.bold + " " + 'I am good!'.red.bold
puts '%s %s' % ["How are you?".blue.bold, 'I am good!'.red.bold]
```

## Using stored style attributes to apply to a String later:

```ruby
# example.rb

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

## Compatibility

Because this gem makes use of [refinements][1], it is only compatible with Ruby version 2.0.0 and above (excluding any future release of Ruby 3).

[1]: https://ruby-doc.org/core-2.4.0/doc/syntax/refinements_rdoc.html
[2]: http://interblah.net/why-is-nobody-using-refinements

