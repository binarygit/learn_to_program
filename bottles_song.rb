#!/usr/bin/ruby
require 'pry-byebug'

for number_of_bottles in 99.downto(0)

  if number_of_bottles == 0

  puts "\nNo more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  elsif number_of_bottles == 1

  puts "\n#{number_of_bottles} bottle of beer on the wall, #{number_of_bottles} bottle of beer.
Take one down and pass it around, no more bottles of beer on the wall.\n"

  elsif number_of_bottles == 2

  puts "\n#{number_of_bottles} bottles of beer on the wall, #{number_of_bottles} bottles of beer.
Take one down and pass it around, #{number_of_bottles - 1} bottle of beer on the wall.\n"

  else

  puts "\n#{number_of_bottles} bottles of beer on the wall, #{number_of_bottles} bottles of beer.
Take one down and pass it around, #{number_of_bottles - 1} bottles of beer on the wall.\n"

  end

end

