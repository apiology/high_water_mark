# frozen_string_literal: true

require_relative 'lib/high_water_mark/version'

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
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

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

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('pronto')
  spec.add_development_dependency('pronto-bigfiles')
  spec.add_development_dependency('pronto-punchlist')
  spec.add_development_dependency('pronto-rubocop')
  spec.add_development_dependency('quality', '~> 37')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('simplecov')
end
