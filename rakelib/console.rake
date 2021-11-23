# frozen_string_literal: true

desc 'Load up high_water_mark in pry'
task :console do |_t|
  exec 'pry -I lib -r high_water_mark'
end
