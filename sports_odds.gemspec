
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/sports_odds/version.rb"

Gem::Specification.new do |spec|
  spec.name          = "sports_odds"
  spec.version       = SportsOdds::VERSION
  spec.authors       = ["'Emily S'"]
  spec.email         = ["'emily.sugano@gmail.com'"]

  spec.summary       = %q{Returns NFL sports gambling odds based on user's booking company and team picks.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/esugano/sports-odds-cli-app.git"
  spec.license       = "MIT"
end
