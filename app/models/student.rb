class Student < ApplicationRecord
    has_one :user, as: :profile_owner, dependent: :delete
    has_many :enrollments, dependent: :delete_all
    has_many :departments, through: :enrollments
end