class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [ :admin, :education, :accountting, :personnel, :headmaster ]

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

  private

  def generate_code
    if self.role != 'admin'
      self.code = self.degree_level.department.code + self.id.to_s
      self.save
    end
  end

end
