class Employee < ApplicationRecord
  has_one :user, as: :profile_owner
  belongs_to :department, optional: true
  validates :name, presence: true, length: {maximum: 50}
end
