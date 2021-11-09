#!/usr/bin/ruby
require 'pry-byebug'

line_width = 50

chapters = ["\nChapter 1: Numbers", "\nChapter 2: Letters", "\nChapter 3: Variables", "\nChapter 4: Classes",
            "\nChapter 5: Modules"]
page_nums = ['page 1', 'page 5', 'page 9', 'page 15', 'page 20']

i = 0
while i < chapters.length
  puts chapters[i] + page_nums[i].rjust(line_width / 3)
  i += 1
end
