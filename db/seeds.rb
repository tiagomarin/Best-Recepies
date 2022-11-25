require 'faker'

User.create(name: 'Admin', email: 'admin@admin.com', password: '654321', role: 'admin')

users = []
foods = []
recipes = []

users.push(User.create(name: 'TestUser', email: 'test@test.com', password: '123456'))

5.times do
  users.push(User.create do |user| 
    user.name = Faker::FunnyName.name_with_initial
    user.email = Faker::Internet.email
    user.password = Faker::Internet.password
  end
  )
end

users.each do |user|
  7.times do
    foods.push(Food.create do |food|
      food.name = Faker::Food.ingredient
      food.measurement_unit = Faker::Food.metric_measurement
      food.price = rand(0.1..16.0).round(2)
      food.quantity = rand(0.1..16.0).round(2)
      food.user_id = user.id
    end
    )
  end
end

# recipe.preparation_time = rand(0.1..3.0)

users.each do |user|
  7.times do
    user_recipe = Recipe.create do |recipe|
      recipe.name = Faker::Food.dish
      recipe.preparation_time =  rand(0.1..3.0).round(2)
      recipe.cooking_time = rand(0.1..3.0).round(2)
      recipe.description = Faker::Food.description
      recipe.public = true
      recipe.user_id = user.id
    end
    5.times do
      RecipeFood.create(quantity: rand(0.1..16.0).round(2), recipe_id: user_recipe.id, food_id: foods[rand(34)].id)
    end
  end
end


# Food.create(name: 'banana', measurement_unit: 'unit', price: '2.5', quantity: '0.5', user_id: 2)
# Food.create(name: 'oat flour', measurement_unit: 'kg', price: '3.5', quantity: '0.1', user_id: 2)
# Recipe.create(name: 'Banana Pancake', preparation_time: '0.15', cooking_time: '0.15', description: 'Healthy and tasty banana pancake', public: true, user_id: 2)

# User.create(name: Faker::FunnyName.name_with_initial, email: 'test2@test.com', password: '123456')
# Food.create(name: 'apple', measurement_unit: 'unit', price: '2.5', quantity: '0.5', user_id: 3)
# Food.create(name: 'flour', measurement_unit: 'kg', price: '3.5', quantity: '0.1', user_id: 3)
# Recipe.create(name: 'Apple Pancake', preparation_time: '0.15', cooking_time: '0.15', description: 'Healthy and tasty apple pancake', public: true, user_id: 3)


