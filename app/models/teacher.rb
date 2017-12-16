class Teacher < ApplicationRecord
  has_one :user, as: :profile_owner
  belongs_to :department, optional: false
  has_many :degrees, :class_name => "TeacherDegree", foreign_key: "teacher_id", dependent: :delete_all
  has_many :interests, :class_name => "TeacherInterest", foreign_key: "teacher_id", dependent: :delete_all
  accepts_nested_attributes_for :degrees, allow_destroy: true, reject_if: proc { |a| a[:field].blank? or a[:date_awarded].blank? or a[:university].blank?}
  accepts_nested_attributes_for :interests, allow_destroy: true, reject_if: proc { |a| a[:field].blank?}
  validates :degrees, presence: true
  validates :interests, presence: true
  validates :name, presence: true, length: {maximum: 50}
end
