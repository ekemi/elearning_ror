class Course < ApplicationRecord
  belongs_to :student
  has_many :reviews

end
