class TeacherDegree < ApplicationRecord
    belongs_to :teacher, optional: false
    validates :title, presence: true
    validates :date_awarded, presence: true
    validates :university, presence: true
    validates :field, presence: true
end
