#!/usr/bin/ruby
require 'pry-byebug'

def quicksort(array)
  return [] if array.empty?
  return array if array.length == 1

  pivot = array.pop
  less_than_pivot = []
  more_than_pivot = []
  array.each do |item|
    less_than_pivot << item if item <= pivot
    more_than_pivot << item if item > pivot
  end
  less_than_pivot = quicksort(less_than_pivot)
  more_than_pivot = quicksort(more_than_pivot)

  less_than_pivot + [pivot] + more_than_pivot
end

array = Array.new(5) { rand(1..5) }
p array
p quicksort(array)
