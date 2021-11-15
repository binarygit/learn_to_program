#!/usr/bin/ruby
require 'pry-byebug'

# string sorting algorithm that uses quicksort
# , sorts as per appearence in dictionary
# not by word's unicode value

# capital letters have smaller unicode value than small letters
# which is why in a normal sort
# 'Bir' would be sorted as lesser than 'abhi'


def dictionary_sort(array)
  return [] if array.empty?
  return array if array.length == 1

  capital_words = array.select { |item| item != item.downcase }
  unless capital_words.empty?
    original_array = Marshal.load(Marshal.dump(array))
    array = array_downcase(array)
  end

  pivot = array.pop
  less_than_pivot = []
  more_than_pivot = []
  array.each do |item|
    less_than_pivot << item if item <= pivot
    more_than_pivot << item if item > pivot
  end
  less_than_pivot = dictionary_sort(less_than_pivot)
  more_than_pivot = dictionary_sort(more_than_pivot)

  array = less_than_pivot + [pivot] + more_than_pivot

  (array = replace_with_capital_words(original_array, array)) unless capital_words.empty?
  return array
end

def array_downcase(array)
  array.map { |item| item.downcase }
end

def replace_with_capital_words(original_array, array)
  original_array.map do |item|
    if item.capitalize == item
      index = array.index(item.downcase)
      array.insert(index, item)
      array.delete_at(index + 1)
    end
  end

  return array
end

array = %w(Bir bir bir Abhi chiru Abhi Chiru)
p array
p dictionary_sort(array)
