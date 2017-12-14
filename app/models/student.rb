class Student < ApplicationRecord
    has_one :user, as: :profile_owner
end