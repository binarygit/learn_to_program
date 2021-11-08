#!/usr/bin/ruby
require 'pry-byebug'

def hours_in_a_year
  puts "There are #{24 * 365} hours in a year"
end

def minutes_in_a_decade
  puts "There are #{60 * 24 * 365 * 10} minutes in a decade"
end

def my_age_in_seconds
  age_in_years = 22
  seconds_in_a_year = 60 * 60 * 24 * 365
  puts "I am #{seconds_in_a_year * age_in_years} seconds old"
end

def authors_age
  age_in_seconds = 1_390_000_000
  second_in_terms_of_year = 1.0 / (60 * 60 * 24 * 365)
  p second_in_terms_of_year
  puts "Author is #{second_in_terms_of_year * age_in_seconds} years old"
end

hours_in_a_year
minutes_in_a_decade
my_age_in_seconds
authors_age
