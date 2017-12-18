class CourseNote < ApplicationRecord
    belongs_to :course, optional: false
end
