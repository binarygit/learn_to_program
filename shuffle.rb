#!/usr/bin/ruby
require 'pry-byebug'

# seems like shuffling is just
# randomized sorting
# this code is heavily copied from my
# quicksort code

def shuffle_array(array)
  return [] if array.empty?
  return array if array.length == 1

  pivot = array.pop
  left_shuffled = []
  right_shuffled = []

  array.each do |item|
    random_maker = rand(2)
    left_shuffled.push(item) if random_maker == 0
    right_shuffled.push(item) if random_maker == 1
  end
  left_shuffled = shuffle_array(left_shuffled)
  right_shuffled = shuffle_array(right_shuffled)

  random_maker = rand(4)
  return (left_shuffled + [pivot] + right_shuffled) if random_maker == 0
  return (right_shuffled + [pivot] + left_shuffled) if random_maker == 1
  return ([pivot] + right_shuffled + left_shuffled) if random_maker == 2
  return (right_shuffled + left_shuffled + [pivot]) if random_maker == 3
end

array = Array.new(5) { rand(1..5) }
p array
p shuffle_array(array)
