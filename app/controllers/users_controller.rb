class UsersController < ApplicationController
    before_action :authenticate_user!, only: %i[new edit create destroy]

    def new
        @user = User.new
        redirect_to new_user_session_path
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
