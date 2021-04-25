class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [ :admin, :accountting, :personnel ]

  enum gender: {
    'Nam': true,
    'Nữ': false
  }

  after_create :generate_code

  belongs_to :degree_level, optional: true

  has_many :business_trip_users
  has_many :business_trips, through: :business_trip_users

  scope :searchByName, -> (name) {
    where('full_name LIKE ?', "%#{name}%")
  }

  def admin?
    self.role == "admin"
  end

  def personnel?
    self.role == "personnel"
  end

  def head_of_department?
    User.where(id: Department.all.pluck(:user_id)).include?(self)
  end

  def financial_department?
    User.where(degree_level: Department.find_by(name: 'Bộ phận tài vụ').degree_levels).include?(self)
  end

  def hr_department?
    User.where(degree_level: Department.find_by(name: 'Bộ phận nhân sự').degree_levels).include?(self)
  end

  private

  def generate_code
    if self.role != 'admin'
      self.code = self.degree_level.department.code + self.id.to_s
      self.save
    end
  end

end
