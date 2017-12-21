class User < ApplicationRecord
  has_friendship
  belongs_to :profile_owner, polymorphic: true, optional: false
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :profile_owner_id, uniqueness: {scope: :profile_owner_type}
  ransack_alias :ownername, :profile_owner_name
  alias_attribute :u_id, :id
  alias_attribute :u_name, :name
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
