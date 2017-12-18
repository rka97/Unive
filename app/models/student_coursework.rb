class StudentCoursework < ApplicationRecord
    belongs_to :course, optional: false
    belongs_to :student, optional: false
    belongs_to :coursework, optional: false
end
