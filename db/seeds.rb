require "open-uri"
require 'json'
require 'pry'
require 'nokogiri'


def line
  puts "-------------------------------------"
end


puts "Destroying users..."
User.destroy_all

puts "Creating new users..."
nico = User.create(email: "nico@gmail.com", password: "123456")
sy = User.create(email: "sy@gmail.com", password: "123456")

puts "#{User.all.count} users created"
line

puts "Destroying pokemons..."
Pokemon.destroy_all


puts "Creating new pokemons..."
line


pokemons = ["pikachu", "raichu", "charmander", "charmeleon", "charizard", "squirtle", "wartortle", "blastoise", "bulbasaur", "ivysaur", "venusaur", "caterpie", "metapod", "butterfree", "weedle", "kakuna", "beedrill", "pidgey", "pidgeotto", "pidgeot", "rattata", "raticate", "spearow", "fearow", "ekans", "arbok", "sandshrew", "sandslash"]

pokemons.each do |pokemon|
  url = "https://pokeapi.co/api/v2/pokemon/#{pokemon}"
  pokemon_serialized = open(url).read
  pokemon = JSON.parse(pokemon_serialized)

  puts "Creating #{pokemon["species"]["name"].capitalize} "

  puts "- Type:#{pokemon['types'][0]['type']['name']}"


  url = "https://www.pokemon.com/us/pokedex/#{pokemon["species"]["name"]}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  pokemon_description = html_doc.search('.version-y.active')[0].text.strip

  puts "- Description:#{pokemon_description}"

  lat = "-37.#{rand(704195..873421)}".to_f
  lng = "144.#{rand(857267..999999)}".to_f
  pokemon_address = Geocoder.search([lat, lng]).first.address

  puts "- Address:#{pokemon_address}"

  new_pokemon = Pokemon.new(
    name: pokemon["species"]["name"],
    description: pokemon_description,
    price: rand(45..250),
    pokemon_type: pokemon["types"][0]["type"]["name"],
    address: pokemon_address,
    user: User.all.sample)
  if pokemon["id"].to_i < 100
    if pokemon["id"].to_i < 10
      pokemon_id = "00#{pokemon["id"]}"
    else
      pokemon_id = "0#{pokemon["id"]}"
    end
  else
    pokemon_id = pokemon["id"]
  end

  pokemon_photo_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/#{pokemon_id}.png"
  pokemon_photo = URI.open(pokemon_photo_url)
  new_pokemon.photos.attach(io: pokemon_photo, filename: "#{pokemon["species"]["name"]}.png", content_type: 'image/png')

  puts "#{new_pokemon.name.capitalize} created!" if new_pokemon.save!
  line
  sleep(5)
end

puts "#{Pokemon.all.count} pokemons created"


