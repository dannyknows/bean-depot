class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def company_details
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to profiles_path
  end

  def admin
    @users = User.all
    @producers = Producer.all
  end

  private

  def user_params
    user_params = params.require(:user).permit(:fname, :lname, :email)
  end

  def find_user
    @user = User.find_by(id: current_user.id)
  end
end
