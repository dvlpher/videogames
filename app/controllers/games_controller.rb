class GamesController < ApplicationController

    def index
        @games = Game.all.includes(:ordered_games)
    end

    def show
        @game = Game.find_by(id: params[:id])
    end

end