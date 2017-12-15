class Department < ApplicationRecord
    has_many :enrollments, dependent: :delete_all
    has_many :students, through: :enrollments
    validates :name, presence: true
    validates :abbreviation, presence: true
end
