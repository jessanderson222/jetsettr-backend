# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

Country.destroy_all

countryapi_url = 'http://countryapi.gear.host/v1/Country/getCountries'
response = RestClient.get(countryapi_url)
data = JSON.parse(response)
countrydata = data["Response"]

countrydata.each do |indcountry|
   country = Country.new
   country.name = indcountry["Name"]
   country.region = indcountry["Region"]
   country.subregion = indcountry["SubRegion"]
   country.currency = indcountry["CurrencyName"]
   country.save
end 

puts "done!"