# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize first account:
first_user = User.create! do |u|
  u.email     = 'abc@test.com'
  u.password    = '123123'
end

Department.create(code: 'CTI', name: 'Bo mon Tin')

Teacher.create(full_name: 'Bui Xuan Ngoc', gender: 1, department_id: Department.first, user_id: first_user.id)
