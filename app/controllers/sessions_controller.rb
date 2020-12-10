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
            #only use with a redirect
            flash[:error] = "Sorry, your username or password was incorrect."
            redirect_to '/login'
        end
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.username = auth['info']['name'].split(" ").join("")
        u.age = 18
        u.password = SecureRandom.hex
        end
        
        session[:user_id] = @user.id
        redirect_to '/profiles'
    end

    def home
        if logged_in? 
            redirect_to user_path(current_user)
        end
    end

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end

    private
    def auth 
        request.env['omniauth.auth']                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    end
    
end