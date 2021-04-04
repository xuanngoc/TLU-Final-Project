class Teacher < ApplicationRecord
  before_save :generate_code

  belongs_to :department
  belongs_to :user, optional: true

  enum gender: {
    'Nam' => true,
    'Nữ' => false
  }

  accepts_nested_attributes_for :department

  private

  def generate_code
    self.code = self.department.code + self.id.to_s
  end

end
