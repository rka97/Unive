class StudentCoursework < ApplicationRecord
    belongs_to :student, optional: false
    belongs_to :coursework, optional: false
end
