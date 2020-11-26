class User < ApplicationRecord
    has_many :video_games, through: :profiles
end
