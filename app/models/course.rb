class Course < ApplicationRecord
    belongs_to :department, optional: false
end
