class Coursework < ApplicationRecord
    belongs_to :course, optional: false
    alias_attribute :cw_id, :id
    alias_attribute :cw_title, :title
end
