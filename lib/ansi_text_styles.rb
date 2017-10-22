module AnsiTextStyles

  VERSION = '1.0.0'

  STYLES = {
      # text properties
      none: 0, # turn off all attributes
      bold: 1, bright: 1, # bold or increased intensity
      faint: 2, # decreased intensity
      italic: 3, underline: 4,
      blink: 5, blink_slow: 5, # slow blink
      blink_fast: 6, # fast blink
      reverse: 7, # swap foreground and background colours
      hide: 8, # foreground color same as background
      crossed_out: 9,

      # foreground colours
      black: 30, grey: 90, lt_grey: 37, white: 97,
      red: 31, lt_red: 91, 
      green: 32, lt_green: 92,
      dk_yellow: 33, brown: 33, yellow: 93,
      blue: 34, lt_blue: 94,
      magenta: 35, pink: 95, lt_magenta: 95,
      cyan: 36, lt_cyan: 96,
      default: 39,
      default_fg: 39,
      
      # background colours
      bg_black: 40, bg_grey: 100, bg_lt_grey: 47, bg_white: 107,
      bg_red: 41, bg_lt_red: 101,
      bg_green: 42, bg_lt_green: 102,
      bg_dk_yellow: 43, bg_brown: 43, bg_yellow: 103,
      bg_blue: 44, bg_lt_blue: 104,
      bg_magenta: 45, bg_pink: 105, bg_lt_magenta: 105,
      bg_cyan: 46, bg_lt_cyan: 106,
      default_bg: 49,
    }

  def self.styles
    STYLES.keys
  end

  refine String do
    def style_code(*codes)
      "\e[%sm%s\e[m" % [codes.flatten.compact.join(';'), self.to_s]
    end

    # applies the named style to the current string
    def style(*styles, fg: nil, bg: nil)
      # convert styles to codes
      codes = STYLES.values_at(*styles.flatten).compact

      # convert foreground and background codes
      codes.push(*coerce_rgb_code(fg))
      codes.push(*coerce_rgb_code(bg, bg: true))

      style_code(codes)
    end

    def coerce_rgb_code(value, bg: false)
      v = bg ? 48 : 38
      case value
      when Array   ; [v, 2, *Array.new(3) {|i| value[i] || 0 }[0...3]]
      when Hash    ; [v, 2, value[:r] || value[:red] || 0, value[:g] || value[:green] || 0, value[:b] || value[:blue] || 0]
      when Integer ; [v, 5, value]
      end
    end

    # create instance methods for each text attribute (chainable)
    STYLES.each do |attr, _|
      define_method(attr) { self.style(attr) }
    end
  end

end

