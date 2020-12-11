class ProfilesController < ApplicationController
    before_action :check_if_logged_in, except: [:index]
    def new
        #checks if it's nested and it's a proper id
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            #nested route
           @profile = @game.profiles.build
        else
            #unnested
            @profile = Profile.new
        end    
    end

    def create
        @profile = current_user.profiles.build(profile_params)
        current_user.profiles.build
        if @profile.save
            redirect_to profile_path(@profile)
        else
            render :new
        end
    end

    def index
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @profiles = game.profiles
        else
            if params[:percent_completed]
                @profiles = Profile.search_by_progress(params[:percent_completed]).order_by_last_played
                # @profiles = Profile.order_by_last_played if @profiles == []
            else
                @profiles = Profile.order_by_last_played
            end
        end
    
    end

    def show
        set_profile
    end

    def edit
        edit_profile
    end

    def update
        edit_profile
        if @profile.update(profile_params)
            redirect_to profile_path(@profile)
        else
            render :edit
        end

    end

    def destroy
        edit_profile
        @profile.destroy
        redirect_to profiles_path
    end

    private

    def set_profile
        @profile = Profile.find_by(id: params[:id])
        if !@profile
            redirect_to profiles_path
        end
    end

    def edit_profile
        @profile = current_user.profiles.find_by(id: params[:id])
        if !@profile
            redirect_to profiles_path
        end
    end

    def profile_params
        params.require(:profile).permit(:name, :percent_completed, :game_id)
    end
    
end