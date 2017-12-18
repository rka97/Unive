class Lecture < ApplicationRecord
    belongs_to :teacher, optional: false
    belongs_to :course, optional: false
    alias_attribute :lec_id, :id
end
