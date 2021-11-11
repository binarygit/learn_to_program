#!/usr/bin/ruby

# program that fetches 10 trivia questions
# and lets user play a game answering those
# 10 questions
# At the end, it lists the correct answers and
# how many questions the user got right

# issue: symbols such as double quotes, quotes etc aren't displayed
# could be because they are HTML encodings
# and I am only parsing JSON

require 'pry-byebug'
require 'json'
require 'net/http'

def fetch_trivia
  url = URI("https://opentdb.com/api.php?amount=10&type=multiple")

  json_response = Net::HTTP.get(url)
  trivia = JSON.parse(json_response)
end

def play_game(trivia)
  # exit program if something goes wrong
  # while fetching the questions
  puts 'errorr'; exit if trivia['response_code'] != 0

  # stores all the choices displayed
  choices_hash = {}

  i = 0
  score = 0
  while i < trivia['results'].length

    # assigning variables
    question = trivia['results'][i]['question']
    incorrect_answers = trivia['results'][i]['incorrect_answers']
    correct_answer = trivia['results'][i]['correct_answer']
    # choices need to be displayed randomly,
    # the sort! helps in randomizing
    choices = incorrect_answers.push(correct_answer).sort!

    # displaying game screen
    puts ''
    puts " #{i + 1}. #{question}\n\n"
    choices.each_with_index { |item, idx| print " #{idx + 1}. #{item} " }
    puts "\n\n"
    print 'Your answer: '

    answer = gets.chomp
    answer = choices[answer.to_i - 1]

    # keep score
    score += 1 if answer == correct_answer

    choices_hash[i] = choices

    i += 1
  end

  display_correct_answers(trivia, choices_hash)

  puts "\nYour score is: #{score}"
end

def display_correct_answers(trivia, choices_hash)
  correct_answers = []
  i = 0
  while i < trivia['results'].length
    correct_answers.push(trivia['results'][i]['correct_answer'])
    i += 1
  end

  puts ''
  puts "The correct answers are: "

  i = 0
  while i < correct_answers.length
    item = correct_answers[i]
    puts " #{i + 1}. #{item}(#{choices_hash[i].index(item) + 1}) "
    i += 1
  end
end

play_game(fetch_trivia)
