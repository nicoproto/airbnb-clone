require "open-uri"

puts "Destroying users..."
User.destroy_all

puts "Creating new users..."
nico = User.create(email: "nico@gmail.com", password: "123456")
sy = User.create(email: "sy@gmail.com", password: "123456")


puts "Destroying pokemons..."
Pokemon.destroy_all


puts "Creating new pokemons..."
pikachu = Pokemon.new(name: "Pikachu", description: "Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it's evidence that this Pokémon mistook the intensity of its charge.", price: 120, pokemon_type: "electric", address: "47 Claremont St, South Yarra", user: nico)

pikachu_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png')
pikachu.photos.attach(io: pikachu_photo, filename: 'pikachu.png', content_type: 'image/png')
pikachu.save!

charmander = Pokemon.new(name: "Charmander", description: "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.", price: 100, pokemon_type: "fire", address: "106 Bridge Road, Richmond VIC", user: sy)

charmander_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png')
charmander.photos.attach(io: charmander_photo, filename: 'charmander.png', content_type: 'image/png')
charmander.save!


squirtle = Pokemon.new(name: "Squirtle", description: "Squirtle's shell is not merely used for protection. The shell's rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.", price: 80, pokemon_type: "water", address: "41 Stewart St, Melbourne", user: nico)

squirtle_photo = URI.open('https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png')
squirtle.photos.attach(io: squirtle_photo, filename: 'squirtle.png', content_type: 'image/png')
squirtle.save!
