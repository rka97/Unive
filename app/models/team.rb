class Team < ApplicationRecord
  has_many :student_teams, dependent: :destroy
  has_many :students, through: :student_team
  validates_presence_of :students
end
