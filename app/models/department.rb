class Department < ApplicationRecord

  has_one :user, class_name: "user"

end
