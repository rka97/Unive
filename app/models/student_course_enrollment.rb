class StudentCourseEnrollment < ApplicationRecord
    belongs_to :student, optional: false
    belongs_to :course, optional: false
    validates :status, presence: true
end
