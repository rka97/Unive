class Student < ApplicationRecord
    has_one :user, as: :profile_owner, dependent: :delete
    has_many :enrollments, dependent: :delete_all
    has_many :departments, through: :enrollments
    has_many :course_enrollments, :class_name => "StudentCourseEnrollment", foreign_key: "student_id", dependent: :delete_all
    has_many :courses, through: :course_enrollments
    has_many :student_courseworks, dependent: :delete_all
    alias_attribute :works, :student_courseworks
    validates :enrollments, presence: true
    validates_format_of :gender, :with => /\Amale\Z|\Afemale\Z|\Ana\Z/i
    accepts_nested_attributes_for :enrollments, allow_destroy: true, reject_if: proc { |a| a[:degree].blank? }
    before_save { self.gender = self.gender.downcase }
end