require 'faker'
# require 'unsplash'
User.create(name: 'Admin', email: 'admin@admin.com', password: '654321', role: 'admin')
User.create(name: Faker::FunnyName.name_with_initial, email: 'test@test.com', password: '123456')

Food.create(name: 'banana', measurement_unit: 'unit', price: '0.5', quantity: '1', user_id: 2)
