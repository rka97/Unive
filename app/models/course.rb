class Course < ApplicationRecord
    belongs_to :department, optional: false
    has_many :course_enrollments, :class_name => "StudentCourseEnrollment", foreign_key: "course_id", dependent: :delete_all
    has_many :students, through: :course_enrollments
    has_many :teacher_courses, :class_name => "TeacherCourse", foreign_key: "course_id", dependent: :delete_all
    has_many :teachers, through: :teacher_courses
    has_many :courseworks, dependent: :delete_all
    has_many :course_notes, dependent: :delete_all
    has_many :lectures, dependent: :delete_all
    alias_attribute :coursenotes, :course_notes
end
