require "dotenv/load"
require "http"
require "json"
pp "Where are you location?"
user_location = gets.chomp
#user_location = "Tenerife"
gm_api_url="https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location+ "&key=" +ENV.fetch("GMAPS_KEY")
pp gm_api_url
raw_gm_api=HTTP.get(gm_api_url).to_s
#pp raw_gm_api
parse_gm_body = JSON.parse(raw_gm_api)
#pp parse_gm_body.keys
results=parse_gm_body.fetch("results")
#pp results.class
#pp results.length
first_result = results.at(0)
#pp first_result.class
#pp first_result.keys
geo =first_result.fetch("geometry")
location= geo.fetch("location")
#pp lat=location.fetch("lat")
#pp lng=location.fetch("lng")
pw_key = ENV.fetch("PIRATE_WEATHER_KEY") 
pw_api_url="https://api.pirateweather.net/forecast/"+pw_key+"/"+lat.to_s+","+lng.to_s
raw_pw_body= HTTP.get(pw_api_url).to_s
parse_pw_body = JSON.parse(raw_pw_body)
#pp parse_pw_body.class
#pp parse_pw_body.keys
currently= parse_pw_body.fetch("currently")
pp currently.fetch("temperature")
