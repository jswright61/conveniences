# frozen_string_literal: true

require_relative "lib/conveniences/version"

Gem::Specification.new do |spec|
  spec.name = "conveniences"
  spec.version = Conveniences::VERSION
  spec.authors = ["Scott Wright"]
  spec.email = ["scott@wrightzone.com"]

  spec.summary = "A handful of ActiveSupport-style core extensions, with no Rails required"
  spec.description = "Homegrown blank?/present?, deep_symbolize_keys, and String inflection (pluralize/camelize/titleize/constantize) core extensions for non-Rails projects."
  spec.homepage = "https://codeberg.org/jswright61/conveniences"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.files = Dir["lib/**/*"] + ["LICENSE"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "standard", "~> 1.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
