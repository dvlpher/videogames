class Game < ApplicationRecord
    validates :name, :rating, prescence: true
    has_many :profiles, dependent: :destroy
    has_many :users, through: :profiles

    scope :order_by_rating, -> {order(:rating)}
    scope :order_by_difficulty, -> {order(:difficulty_level)}
    scope :search_by_difficulty, -> (search_difficulty){where("difficulty_level = ?", search_difficulty)}
    scope :search_by_rating, -> (search_rating){where("rating = ?", search_rating)}
end
