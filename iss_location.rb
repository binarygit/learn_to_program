#!/usr/bin/ruby

# opens google maps in browser 
# and shows the location of the
# International Space Station

require 'pry-byebug'
require 'json'
require 'net/http'

# api that provides the location of iss
url = URI('http://api.open-notify.org/iss-now.json')
request = Net::HTTP.get(url)
iss_hash = JSON.parse(request)

iss_pos = iss_hash['iss_position']
latitude = iss_pos['latitude']
longitude = iss_pos['longitude']
lat_long = "#{latitude},#{longitude}"

# q = location of the (red) pointer
# ll = latitude longitude
# when ll and q are the same, map opens 
# with the pointer centered on the ll
# z = zoom amount, 1 is the most zoomed
# and it seems 4 is as far back as 
# the zoom can go
map_url = "https://maps.google.com/?q=#{lat_long}&ll=#{lat_long}&z=1"

# this opens the browser
system('xdg-open', map_url)



