require 'faker'

User.create(name: 'Admin', email: 'admin@admin.com', password: '654321', role: 'admin')

User.create(name: Faker::FunnyName.name_with_initial, email: 'test@test.com', password: '123456')
Food.create(name: 'banana', measurement_unit: 'unit', price: '2.5', quantity: '0.5', user_id: 2)
Food.create(name: 'oat flour', measurement_unit: 'kg', price: '3.5', quantity: '0.1', user_id: 2)
Recipe.create(name: 'Banana Pancake', preparation_time: '0.15', cooking_time: '0.15', description: 'Healthy and tasty banana pancake', public: true, user_id: 2)

User.create(name: Faker::FunnyName.name_with_initial, email: 'test2@test.com', password: '123456')
Food.create(name: 'apple', measurement_unit: 'unit', price: '2.5', quantity: '0.5', user_id: 3)
Food.create(name: 'flour', measurement_unit: 'kg', price: '3.5', quantity: '0.1', user_id: 3)
Recipe.create(name: 'Apple Pancake', preparation_time: '0.15', cooking_time: '0.15', description: 'Healthy and tasty apple pancake', public: true, user_id: 3)
