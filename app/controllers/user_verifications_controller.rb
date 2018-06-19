class UserVerificationsController < ApplicationController

  before_filter :load_user_using_perishable_token

  def show
    if @user
      @user.verify!
      render
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    render text: "Unable to find your account" unless @user
  end

end
