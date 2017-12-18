class Coursework < ApplicationRecord
    belongs_to :course, optional: false
    has_many :student_courseworks, dependent: :delete_all, class_name: 'StudentCoursework', foreign_key: 'coursework_id'
    has_many :students, through: :student_courseworks
    alias_attribute :cw_id, :id
    alias_attribute :cw_title, :title
end
