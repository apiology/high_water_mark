# frozen_string_literal: true

require 'quality/rake/task'

Quality::Rake::Task.new do |task|
  # Exclude these files for bigfiles reasons.
  #
  # Gemfile.lock and is large and not really refactorable
  #
  # .rubocop.yml is pretty regular and a refactor would just make
  # things harder to find.
  #
  # CODE_OF_CONDUCT.md is vendored
  task.exclude_files = ['Gemfile.lock', '.rubocop.yml', 'CODE_OF_CONDUCT.md']
  # cane deprecated in favor of rubocop, reek rarely actionable
  task.skip_tools = %w[reek cane]
  task.output_dir = 'metrics'
  task.punchlist_regexp = 'XX' \
                          'X|TOD' \
                          'O|FIXM' \
                          'E|OPTIMIZ' \
                          'E|HAC' \
                          'K|REVIE' \
                          'W|LATE' \
                          'R|FIXI' \
                          'T|xi' \
                          't '
  # task.verbose = true
end

desc 'Static analysis and metrics enforcement'
task quality: %i[pronto update_bundle_audit]
