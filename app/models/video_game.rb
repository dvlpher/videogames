class VideoGame < ApplicationRecord
    has_many :users, through: :profiles
end
