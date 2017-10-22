# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

Items in this section will be included in the next release.

## [1.1.0] - 2017-10-22

### Added
- started using CHANGELOG
- Support for 8-bit (256) colour codes for foreground and background
- Added tests for the 8-bit (256) colour codes
- README includes 8-bit colour example
- Support for true colour (RGB) for foreground and background
- Added tests for the true colour (RGB) colour codes
- README includes true colour example
- Added `faint`, `blink_fast`, and `default_bg` to named styles
- README includes the named style methods, codes, and descriptions
- Added examples directory with each example from the README in a separate file

### Thanks
8-bit and true colour improvements were inspired by [Richard's](https://stackoverflow.com/users/752843/richard) [answer](https://stackoverflow.com/a/33206814/848668) on Stack Overflow.

## [1.0.0]
### Added
- Named text styles using ANSI codes
- Named styles are callable as methods directly on a string
- Implemented using Refinements due to their low impact
