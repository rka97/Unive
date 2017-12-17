class TeacherCourse < ApplicationRecord
    belongs_to :teacher, optional: false
    belongs_to :course, optional: false
end
