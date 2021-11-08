#!/usr/bin/ruby
require 'pry-byebug'

def full_name_greeting
  puts "What is your first name?"
  name = gets.chomp
  puts "What is your last name?"
  last_name = gets.chomp
  puts "Nice to meet you #{name + ' ' + last_name}. I hope you are having a great day"
end

def bigger_better_favorite_number
  puts "\nWhat is your favorite number?"
  fav_num = gets.chomp.to_i
  puts "Oh come on, #{fav_num + 1} is way better than #{fav_num}"
end

bigger_better_favorite_number

