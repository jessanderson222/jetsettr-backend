class Api::V1::UsersController < ApplicationController

    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all 
        render(json: @users)
    end 

    def create
        user = User.create(user_params)
        if @user.valid?
            render json: { user: UserSerializer.new(@user) }, status: :created
        else 
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end 
    end 

    def update
        @user.update(user_params)
        render json: @user, status: 200
    end 

    def destroy
        userId = @user.id
        @user.destroy
        render json: {message:"User Deleted"}
    end 

    def show
        render json: @card, status: 200
    end 

    private
    def user_params
        params.require(:user).permit(:username, :location, :profile_picture, :email, :password)
    end 

    def set_user
        @user = User.find(params[:id])
    end 
end
