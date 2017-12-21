class Message < ApplicationRecord
  belongs_to :sender_id, class_name:"User", optional: false
  belongs_to :reciever_id, class_name:"User", optional: false
  validates :content, presence: true
end
