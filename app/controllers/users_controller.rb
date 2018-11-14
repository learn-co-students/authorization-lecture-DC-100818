class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def edit
    authorized_for_user(@user)
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :name, :hometown, :favorite_cryptid)
  end
end
