class Teacher < ApplicationRecord
  has_one :user, as: :profile_owner
  belongs_to :department, optional: false
  validates :name, presence: true, length: {maximum: 50}
end
