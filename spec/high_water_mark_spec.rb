# frozen_string_literal: true

require 'high_water_mark/version'

RSpec.describe HighWaterMark do
  it 'has a version number' do
    expect(HighWaterMark::VERSION).not_to be_nil
  end
end
