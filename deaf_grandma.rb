#!/usr/bin/ruby
require 'pry-byebug'

bye_count = 0

# loop exits when "BYE" is typed thrice in a row
loop do
  puts "\nWhat do you want to say to Grandma?"
  input = gets.chomp

  if input == "BYE"
    bye_count += 1
  elsif input == input.upcase && input != "BYE"
    puts "NO, NOT SINCE #{rand(1931..1951)}"
    bye_count = 0
  else
    puts "HUH?! SPEAK UP, SONNY!!"
    bye_count = 0
  end

  break if bye_count == 3
end
