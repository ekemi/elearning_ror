class Student < ApplicationRecord
has_secure_password
has_many :courses
has_many :reviews
has_many :reviewed_courses, through: :reviews, source: :course
validates :username,:email, presence: true
validates :username,:email, uniqueness: true
end
