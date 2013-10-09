require File.expand_path("../lib/introjs-rails/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "introjs-rails"
  s.version     = Introjs::Rails::VERSION
  s.authors     = ["Pablo Fernandez"]
  s.email       = ["heelhook@littleq.net"]
  s.homepage    = "https://github.com/heelhook/intro.js-rails"
  s.summary     = %q{Integrate the excellent Intro.js javascript library with Rails asset pipeline}
  s.description = %q{A better way for new feature introduction and step-by-step users guide for your website and project.}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "thor", "~> 0.14"
  s.add_runtime_dependency "sass-rails", ">= 3.2"
  s.add_development_dependency "bundler", "~> 1.0"
  s.add_development_dependency "rails", "~> 3.0"
  s.add_development_dependency "httpclient", "~> 2.2"
end
