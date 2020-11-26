class Profile < ApplicationRecord
    belongs_to :users
    belongs_to :video_games
end
