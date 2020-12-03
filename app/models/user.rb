class User < ApplicationRecord
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
    has_secure_password

    has_many :profiles
    has_many :games, through: :profiles

    scope :order_by_age, -> {order(:age)}
    scope :order_by_username, -> {order(:username)}
    scope :search_by_age, -> (search_age){where("age = ?", search_age)}
end
