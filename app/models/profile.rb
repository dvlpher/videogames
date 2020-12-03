class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :game

    scope :order_by_last_played, -> {order(:last_updated)}
    scope :order_by_progress, -> {order(:percent_completed)}
    #how to search date?
    # scope :search_by_last_played, -> (search_last_played){where("perecent_completed = ?", 100)}
    scope :search_by_completed, -> (search_completed){where("perecent_completed = ?", 100)}
end
