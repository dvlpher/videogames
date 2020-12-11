class UsersController < ApplicationController

    def index
        @users = User.all.order_by_age
    end

    #loading sign up form
    def new
        @user = User.new
    end

    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            #login the user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
    end


    private
    
    def user_params
        params.require(:user).permit(:username, :age, :name, :email, :password)
    end
    
end