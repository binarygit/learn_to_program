#!/usr/bin/ruby
require 'pry-byebug'

puts "\nHello, What year were you born in?"
year = gets.chomp
puts "\nWhat month?"
month = gets.chomp
puts "\nWhat day?"
day = gets.chomp
puts ''

birthday = Time.new(year, month, day)
puts "your birthday is on #{birthday}"

sec_in_terms_of_year = 1 / (60 * 60 * 24 * 365.25)
num_of_bday = ((Time.now - birthday) * sec_in_terms_of_year).to_i

puts "Wow, that means you've had #{num_of_bday} birthdays!"
puts "Here are #{num_of_bday} emojis for you!"
puts ''
puts '☺' * num_of_bday
