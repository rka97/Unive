class Coursework < ApplicationRecord
    belongs_to :course, optional: false
    has_many :students_courseworks
    alias_attribute :cw_id, :id
    alias_attribute :cw_title, :title
end
