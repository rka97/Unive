class StudentCourseEnrollment < ApplicationRecord
    belongs_to :student, optional: false
    belongs_to :course, optional: false
    validates :status, presence: true
    validates_uniqueness_of :student_id, scope: :course_id
end