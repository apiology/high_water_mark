# frozen_string_literal: true

require 'tmpdir'
require 'high_water_mark/threshold'

# Example use from https://github.com/apiology/bigfiles

# This spec is here to make sure we don't break backwards
# compatibility with how this is used elsewhere (i.e., establish a
# public interface).

describe HighWaterMark do
  let(:hwm_threshold) do
    ::HighWaterMark::Threshold.new(tool_name,
                                   count_io: IO,
                                   count_file: File,
                                   output_dir: output_dir)
  end
  let(:output_dir) { 'some_output_dir' }
  let(:tool_name) { 'foo' }
  let(:threshold_from_file) { 1942 }

  around do |example|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        Dir.mkdir(output_dir)
        example.run
      end
    end
  end

  it 'continues to behave like it did' do
    hwm_threshold.write_violations(threshold_from_file)
    expect(hwm_threshold.threshold).to eq(threshold_from_file)
  end
end
