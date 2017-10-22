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

  def test_8_bit_colours_fg
    assert_equal "test text".style(fg: 55), "\e[38;5;55mtest text\e[m"
  end

  def test_8_bit_colours_bg
    assert_equal "test text".style(bg: 55), "\e[48;5;55mtest text\e[m"
  end

  def test_true_colours_fg_array
    assert_equal "test text".style(fg: [1, 2, 3]), "\e[38;2;1;2;3mtest text\e[m"
  end

  def test_true_colours_bg_array
    assert_equal "test text".style(bg: [1, 2, 3]), "\e[48;2;1;2;3mtest text\e[m"
  end

  def test_true_colours_fg_hash_short
    assert_equal "test text".style(fg: {r: 1, g: 2, b: 3}), "\e[38;2;1;2;3mtest text\e[m"
  end

  def test_true_colours_bg_hash_short
    assert_equal "test text".style(bg: {r: 1, g: 2, b: 3}), "\e[48;2;1;2;3mtest text\e[m"
  end

  def test_true_colours_fg_hash_long
    assert_equal "test text".style(fg: {red: 1, green: 2, blue: 3}), "\e[38;2;1;2;3mtest text\e[m"
  end

  def test_true_colours_bg_hash_long
    assert_equal "test text".style(bg: {red: 1, green: 2, blue: 3}), "\e[48;2;1;2;3mtest text\e[m"
  end

  def test_8_bit_colour_fg_with_underline
    assert_equal "test text".style(:underline, fg: {red: 1, green: 2, blue: 3}), "\e[4;38;2;1;2;3mtest text\e[m"
  end

  def test_8_bit_colour_fg_with_underline_and_chained_bold
    assert_equal "test text".bold.style(:underline, fg: {red: 1, green: 2, blue: 3}), "\e[4;38;2;1;2;3m\e[1mtest text\e[m\e[m"
  end

end

