# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'
Ingredient.delete_all
Cocktail.delete_all

puts "Bitch what you on!?"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url).read
hash_ingredients = JSON.parse(file)

hash_ingredients['drinks'].each do |ingredient|
  temp = Ingredient.create(name: ingredient['strIngredient1'])
  # temp = ingredient['strIngredient1']
  p temp
end

puts "Adding the basics"

p Ingredient.create(name: "lemon")
p Ingredient.create(name: "ice")
p Ingredient.create(name: "mint leaves")

puts "Faking Cocktails"

100.times do
  fake_name = Faker::Cannabis.strain
  cocktail = Cocktail.create(name: fake_name)
  p cocktail
end

puts "You done bitch"
