class Student < ApplicationRecord
    has_one :user, as: :profile_owner
    has_many :enrollments
    has_many :departments, through: :enrollments
end