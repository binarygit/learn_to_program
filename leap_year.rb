#!/usr/bin/ruby
require 'pry-byebug'

puts "Input starting year"
starting_year = gets.chomp.to_i
puts "Input ending year"
ending_year = gets.chomp.to_i
puts

for i in starting_year.upto(ending_year)
  if (i % 4) == 0
    if (i % 100) == 0
      if (i % 400) == 0
        puts i
        next
      else
        next
      end
    end
    puts i
  end

end
