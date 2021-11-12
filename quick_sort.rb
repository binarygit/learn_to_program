#!/usr/bin/ruby
require 'pry-byebug'

def quicksort(array)
  return [] if array.empty?

  
  pivot = array[0]
  num_of_pivot = 0

  if array.length == 1
    return array
  else
    less_than_pivot = []
    more_than_pivot = []
    array.each do |item|
      (num_of_pivot += 1; next) if item == pivot
      less_than_pivot << item if item < pivot
      more_than_pivot << item if item > pivot
    end
    less_than_pivot = quicksort(less_than_pivot)
    more_than_pivot = quicksort(more_than_pivot)
  end

  # creates pivot array 
  # with the number of pivots
  # found in the original array
  pivot = Array.new(num_of_pivot, pivot)
  less_than_pivot + pivot + more_than_pivot
end

array = Array.new(5) { rand(1..5) }
quicksort(array) 
