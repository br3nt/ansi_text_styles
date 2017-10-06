require_relative 'lib/ansi_text_styles.rb'

Gem::Specification.new do |spec|
  spec.name = 'ansi_text_styles'
  spec.version = AnsiTextStyles::VERSION
  spec.authors = ['Brent Jacobs', 'br3nt']
  spec.homepage = 'https://github.com/br3nt/ansi_text_styles'
  spec.required_ruby_version = '~> 2.0'
  spec.summary = 'Adds methods to apply ANSI colour codes and text styles to strings.'
  spec.licenses = ['MIT']
  spec.files = [
      'lib/ansi_text_styles.rb',
    ]
end

