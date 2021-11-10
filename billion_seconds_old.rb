#!/usr/bin/ruby
require "pry-byebug"

my_bday = Time.new(1999, 2, 6, 13, 30, 26)
time_rn = Time.now
seconds_since_my_bday = time_rn - my_bday
puts 'I will be a billion seconds old on: '
puts Time.at(my_bday + 1_000_000_000)
