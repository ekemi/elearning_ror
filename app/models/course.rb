class Course < ApplicationRecord
  belongs_to :student
  has_many :reviews
  has_many :students_reviewed, through: :reviews, source: :user
validates :location, :roomNumber , :startDate,:endDate,
:beginningDate, :endingDate,:requirement, presence: true

scope :beta , ->{order('LOWER(topic)')}

def self.search(q)
Course.WHERE("topic LIKE ?","%#{q}%").beta
end
end