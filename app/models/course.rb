class Course < ApplicationRecord
    belongs_to :department, optional: false
    has_many :course_enrollments, :class_name => "StudentCourseEnrollment", foreign_key: "course_id", dependent: :delete_all
    has_many :students, through: :course_enrollments
end
