# coding: ascii
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'high_water_mark/version'

Gem::Specification.new do |spec|
  spec.name          = 'high_water_mark'
  spec.version       = HighWaterMark::VERSION
  spec.authors       = ['Vince Broz']
  spec.email         = ['vince@broz.cc']

  spec.summary       = 'Maintains a directory of high water mark metrics ' \
                       'for quality tools'
  spec.description   = 'Maintains a directory of high water mark metrics ' \
                       'for quality tools - ' \
                       'used by https://github.com/apiology/quality and friends'
  spec.homepage      = 'https://github.com/apiology/high_water_mark'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/apiology/high_water_mark'

  # Specify which files should be added to the gem when it is
  # released.  The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bump'
  spec.add_development_dependency 'bundler'
  # 0.58.0 and 0.57.0 don't seem super compatible with signatures, and
  # magit doesn't seem to want to use the bundled version at the moment,
  # so let's favor the more recent version...
  spec.add_development_dependency 'overcommit', ['>=0.58.0']
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '>=3.4'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  # ensure version with branch coverage
  spec.add_development_dependency 'simplecov', ['>=0.18.0']
  spec.add_development_dependency 'simplecov-lcov'
  spec.add_development_dependency 'undercover'
end
