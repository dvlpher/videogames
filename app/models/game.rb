class Game < ApplicationRecord
    has_many :profiles, dependent: :destroy
    has_many :users, through: :profiles
end
