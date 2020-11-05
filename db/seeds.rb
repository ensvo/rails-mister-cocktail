require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = open(url).read
ingredients = JSON.parse(drinks)

ingredients['drinks'].each do |key|
	name = key['strIngredient1']
	Ingredient.create!(name: name)
end