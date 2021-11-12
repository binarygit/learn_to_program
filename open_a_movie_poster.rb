#!/usr/bin/ruby
require 'pry-byebug'
require 'json'
require 'net/http'

# program lists each video that search returns
# it lists the video's name and its type
# also opens the imdb page of the first movie
# and its poster

apikey = '7ceab58a'
request = "http://www.omdbapi.com/?apikey=#{apikey}"
url = URI(request + "&s=\"Kurt Vonnegut\"")

movie_hash = JSON.parse(Net::HTTP.get(url))

imdb_id = ''
poster_url = ''

puts ''
movie_hash['Search'].each do |movie|
  movie.each_pair do |key, value|
    puts "#{key}: #{value}" if key == "Title"
    puts "#{key}: #{value}\n\n" if key == "Type"
    imdb_id = value if movie_hash['Search'].index(movie) == 0 && key == "imdbID"
    poster_url = value if movie_hash['Search'].index(movie) == 0 && key == "Poster"
  end
end

imdb_url = "https://www.imdb.com/title/#{imdb_id}/"
system('xdg-open', imdb_url)
system('xdg-open', poster_url)
