# frozen_string_literal: true

require 'tmpdir'
require 'high_water_mark/threshold'

# Example use from https://github.com/apiology/bigfiles

# This spec is here to make sure we don't break backwards
# compatibility with how this is used elsewhere (i.e., establish a
# public interface).

describe HighWaterMark do
  let(:quality_threshold) { ::HighWaterMark::Threshold.new('bigfiles') }
  let(:threshold) { quality_threshold.threshold }
  let(:threshold_from_file) { 543 }
  let(:example_files) do
    {
      %w[metrics bigfiles_high_water_mark] => "#{threshold_from_file}\n",
    }
  end

  around do |example|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        example_files.each do |(subdir, filename), contents|
          Dir.mkdir(subdir)
          Dir.chdir(subdir) do
            File.write(filename, contents)
          end
        end
        example.run
      end
    end
  end

  it 'continues to behave like it did' do
    expect(threshold).to eq(threshold_from_file)
  end
end
