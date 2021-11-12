#!/usr/bin/ruby
require 'pry-byebug'

# simple program that logs with indentation
# which block is running
# inside which
# and what values they output
# after running

$i = 0
def log(description, &block)
  $i += 1
  start_notifier = "block started: #{description}"
  puts start_notifier.rjust(start_notifier.length + $i)
  value = block.call
  end_notifier = "block end: #{description}"
  puts end_notifier.rjust(end_notifier.length + $i)
  value = "value of #{description} is #{value}"
  puts value.rjust(value.length + $i)
  $i -= 1
end

log('not nested block') do
  log('nested block') do
    log('nested nested block') { 1 + 1 + 1 }
    1 + 1
  end
  1
end
