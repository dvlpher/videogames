class Game < ApplicationRecord
    validates :name, :rating, presence: true
    has_many :profiles, dependent: :destroy
    has_many :users, through: :profiles
    validates :rating, inclusion: { in: %w(everyone teen mature),
        message: "%{value} is not a valid rating" }
    validates :difficulty_level, inclusion: { in: %w(beginner intermediate advanced),
            message: "%{value} is not a valid difficulty level" }
      validate :old_enough  

    scope :order_by_rating, -> {order(:rating)}
    scope :order_by_difficulty, -> {order(:difficulty_level)}
    scope :search_by_difficulty, -> (search_difficulty){where("difficulty_level = ?", search_difficulty)}
    scope :search_by_rating, -> (search_rating){where("rating = ?", search_rating)}

def old_enough
    @user = User.find_by(id: session[:user_id])
    if @user.age <= 16 && rating == "mature"
        errors.add(:rating, "You are not old enough to play this game")
    end
    if @user.age <= 9 && rating == "teen"
        errors.add(:rating, "You are not old enough to play this game")
    end
end

end
