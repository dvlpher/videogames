class GamesController < ApplicationController

    def index
        @games = Game.all#.includes(:ordered_games)
    end

    def new
       @game = Game.new
       @profile = @game.profiles.build
    end

    def create
        @game = current_user.games.build(game_params)
        @profile = current_user.profiles.build(profile_params)
        @profile.game = @game
        if @game.save && @profile.save
            redirect_to game_path(@game)
        else
            render :new
        end
    end

    def show
        @game = Game.find_by(id: params[:id])
    end

private
    def game_params
        params.require(:game).permit(:title, :rating, :difficulty_level) 
    end

    def profile_params
        params.require(:profile).permit(:name, :percent_completed, :game_id) 
    end

end