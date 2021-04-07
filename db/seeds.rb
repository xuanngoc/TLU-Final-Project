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
  u.role = 'admin'
end

Department.create(code: 'CTI', name: 'Bo phan Tin hoc')

(1..5).each do |i|
  DegreeLevel.create(name: 'Bac ' + i.to_s, department_id: 1)
end

CostType.create(name: 'An uong')
CostType.create(name: 'Di chuyen')
CostType.create(name: 'Khach san')

# Teacher.create(full_name: 'Bui Xuan Ngoc', gender: true, department_id: Department.first, user_id: first_user.id)
