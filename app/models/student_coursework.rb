class StudentCoursework < ApplicationRecord
    belongs_to :student, optional: false
    belongs_to :coursework, optional: false
    validates :mark, presence: true
    validates :date_handed, presence: true
    before_save { self.mark = self.mark > self.coursework.total_mark ? self.coursework.total_mark : self.mark }
end
