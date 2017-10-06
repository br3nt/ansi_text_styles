require 'minitest/autorun'
require 'ansi_text_styles'

using AnsiTextStyles

class AnsiTextStylesTest < Minitest::Test

  def test_style
    style = [:blue, :underline]
    assert_equal "Text styled multiple ways".style(style), "\e[34;4mText styled multiple ways\e[m"
  end

  def test_single_named_style 
    assert_equal "red text".red, "\e[31mred text\e[m" 
  end

  def test_multiple_named_style_chaining
    assert_equal "bold red text".red.bold, "\e[1m\e[31mbold red text\e[m\e[m"
  end

end

