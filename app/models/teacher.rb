class Teacher < ApplicationRecord
  after_create :generate_code

  belongs_to :department
  belongs_to :user

  enum gender: {
    'Nam' => true,
    'Nu' => false
  }

  private

  def generate_code
    code = self.department.code + self.id.to_s
  end

end
