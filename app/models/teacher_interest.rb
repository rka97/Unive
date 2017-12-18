class TeacherInterest < ApplicationRecord
    belongs_to :teacher, optional: false
    validates :field, presence: true
end
