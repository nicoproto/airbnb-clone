require "open-uri"

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

pikachu = Pokemon.new(name: "Pikachu", description: "Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it's evidence that this Pokémon mistook the intensity of its charge.", price: 120, pokemon_type: "electric", address: "47 Claremont St, South Yarra", user: nico)

pikachu_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png')
pikachu.photos.attach(io: pikachu_photo, filename: 'pikachu.png', content_type: 'image/png')
pikachu.save!

puts "#{pikachu.name} created!"
line

raichu = Pokemon.new(name: "Raichu", description: "WIf the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon's nest.", price: 150, pokemon_type: "electric", address: "7/478 Chapel St, South Yarra VIC 3141", user: sy)

raichu_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/026.png')
raichu.photos.attach(io: raichu_photo, filename: 'raichu.png', content_type: 'image/png')
raichu.save!

puts "#{raichu.name} created!"
line

charmander = Pokemon.new(name: "Charmander", description: "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.", price: 100, pokemon_type: "fire", address: "106 Bridge Road, Richmond VIC", user: nico)

charmander_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png')
charmander.photos.attach(io: charmander_photo, filename: 'charmander.png', content_type: 'image/png')
charmander.save!

puts "#{charmander.name} created!"
line

charmeleon = Pokemon.new(name: "Charmeleon", description: "Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.", price: 150, pokemon_type: "fire", address: "248 Swan St, Richmond VIC 3121", user: sy)

charmeleon_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png')
charmeleon.photos.attach(io: charmeleon_photo, filename: 'charmeleon.png', content_type: 'image/png')
charmeleon.save!

puts "#{charmeleon.name} created!"
line

charizard = Pokemon.new(name: "Charizard", description: "Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.", price: 200, pokemon_type: "fire", address: "163 Commercial Rd, South Yarra VIC 3141", user: nico)

charizard_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png')
charizard.photos.attach(io: charizard_photo, filename: 'charizard.png', content_type: 'image/png')
charizard.save!

puts "#{charizard.name} created!"
line

squirtle = Pokemon.new(name: "Squirtle", description: "Squirtle's shell is not merely used for protection. The shell's rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.", price: 80, pokemon_type: "water", address: "Albert Park VIC 3206", user: sy)

squirtle_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png')
squirtle.photos.attach(io: squirtle_photo, filename: 'squirtle.png', content_type: 'image/png')
squirtle.save!

puts "#{squirtle.name} created!"
line

wartortle = Pokemon.new(name: "Wartortle", description: "Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon's toughness as a battler.", price: 120, pokemon_type: "water", address: "175B Beaconsfield Parade, Middle Park VIC 3206", user: nico)

wartortle_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png')
wartortle.photos.attach(io: wartortle_photo, filename: 'wartortle.png', content_type: 'image/png')
wartortle.save!

puts "#{wartortle.name} created!"
line

blastoise = Pokemon.new(name: "Blastoise", description: "Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.", price: 180, pokemon_type: "water", address: "Pier Rd, St Kilda VIC 3182", user: sy)

blastoise_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png')
blastoise.photos.attach(io: blastoise_photo, filename: 'blastoise.png', content_type: 'image/png')
blastoise.save!

puts "#{blastoise.name} created!"
line

puts "#{Pokemon.all.count} pokemons created"


