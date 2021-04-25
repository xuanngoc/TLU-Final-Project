class Department < ApplicationRecord

  has_many :degree_levels, dependent: :destroy

  belongs_to :user, optional: true
end
