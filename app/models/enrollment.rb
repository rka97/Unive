class Enrollment < ApplicationRecord
    belongs_to :student
    belongs_to :department
    validates :degree, presence: true
end
