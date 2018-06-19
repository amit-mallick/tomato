class UsersController < ApplicationController

  require 'net/http'

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save

      EmailValidaterWorker.perform_async(@user.id)

      flash[:notice] = "Account registered!"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user

    if @user.update_attributes(users_params)
      flash[:notice] = "Account Updated"
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
