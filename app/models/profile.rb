class Profile < ApplicationRecord
    belongs_to :user
    belongs_to :game
    

    scope :order_by_last_played, -> {order(:updated_at)}
    scope :order_by_progress, -> {order(:percent_completed)}
    #how to search date?
    # scope :search_by_last_played, -> (search_last_played){where("perecent_completed = ?", 100)}
    scope :search_by_completed, -> (search_completed){where("percent_completed = ?", 100).order(:updated_at)}
    scope :search_by_progress, -> (search_progress){where("percent_completed = ?", search_progress).order(:updated_at)}
end
