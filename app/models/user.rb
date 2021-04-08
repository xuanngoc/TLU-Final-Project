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



end
