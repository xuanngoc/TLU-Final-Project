class DegreeEmployee < ApplicationRecord

  enum type: [:education, :operation]


  scope :education, -> { where(degree_type: :education)}
  scope :operation, -> { where(degree_type: :operation)}

end
