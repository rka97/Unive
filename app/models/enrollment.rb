class Enrollment < ApplicationRecord
    belongs_to :student, optional: false
    belongs_to :department, optional: false
    validates :degree, presence: true
end
