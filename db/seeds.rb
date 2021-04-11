# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@thanglong.edu.vn', password: '123123', role: :admin, full_name: 'just admin')

Department.create(name: 'Bộ phận tài vụ', code: 'MMA')
Department.create(name: 'Bộ phận hành chính', code: 'MMC')
Department.create(name: 'Bộ phận đào tạo', code: 'MME')


Department.all.each do |department|
  5.times do |time|
    DegreeLevel.create(name: 'Bậc ' + time.to_s, department: department)
  end
end

DegreeLevel.all.each do |degree|
  5.times do
    User.create(
      email: Faker::Internet.email(domain: 'thanglong.edu.vn'),
      password: '123123',
      role: :personnel,
      full_name: Faker::Name.name,
      gender: false,
      address: Faker::Address.full_address,
      birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
      degree_level_id: degree.id
    )
  end

end

CostType.create(name: 'Ăn uống')
CostType.create(name: 'Di chuyển')
CostType.create(name: 'Khách sạn')


# CostType.all.each do |cost_type|
#   DegreeLevel.all.each do |degree|
#     LimitCost.create(degree_level_id: degree.id, cost_type_id: cost_type.id, limit: Faker::Number.within(range: 300_000..10_000_000) )
#   end
# end

LimitCost.all.each do |limit|
  LimitCost.find(limit.id).update(limit: Faker::Number.within(range: 300_000..10_000_000))
end
