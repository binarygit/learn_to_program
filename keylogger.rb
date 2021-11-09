#!/usr/bin/ruby
require 'pry-byebug'

words_typed = []
puts "\nWelcome to keylogger"
puts "Type a single char per line and"
puts "I will tell you all the chars that you've typed\n\n"

loop do
  input = gets.chomp
  next if input.length > 1
  break if input == ''

  words_typed << input
end

if words_typed.empty?
  puts "Arghh...it seems you didn't type anything, Ed"
else
  puts words_typed.sort
end
