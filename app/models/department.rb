class Department < ApplicationRecord
    has_many :enrollments, dependent: :delete_all
    has_many :students, through: :enrollments
    has_many :teachers, dependent: :delete_all
    has_many :courses, dependent: :delete_all
    validates :name, presence: true
    validates :abbreviation, presence: true
end
