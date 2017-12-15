class Department < ApplicationRecord
    has_many :enrollments, dependent: :delete_all
    has_many :students, through: :enrollments
end
