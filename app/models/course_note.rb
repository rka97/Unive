class CourseNote < ApplicationRecord
    belongs_to :course, optional: false
    alias_attribute :cn_id, :id
    alias_attribute :cn_title, :title
    alias_attribute :cn_created_at, :created_at
end
