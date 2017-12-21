class Message < ApplicationRecord
  belongs_to :sender, class_name:"User", optional: false, foreign_key: 'sender_id'
  belongs_to :receiver, class_name:"User", optional: false, foreign_key: 'receiver_id'
  validates :content, presence: true
end
