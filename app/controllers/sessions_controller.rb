class SessionsController < ApplicationController
    
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to games_path
        else
            redirect_to 'login'
        end

    end

    def index

    end

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end
    
end