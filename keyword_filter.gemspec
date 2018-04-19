
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "keyword_filter/version"

Gem::Specification.new do |spec|
  spec.name          = "keyword_filter"
  spec.version       = KeywordFilter::VERSION
  spec.authors       = ["Spirit"]
  spec.email         = ["neverlandxy.naix@gmail.com"]

  spec.summary       = %q{Keyword Filter, use DFA(Deterministic Finite Automaton)}
  spec.description   = %q{Keyword Filter, use DFA(Deterministic Finite Automaton)}
  spec.homepage      = "https://github.com/NaixSpirit/keyword_filter"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
