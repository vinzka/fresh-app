class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def me
    @user = current_user
    render :show
  end

  def edit
  end

  def update
    if params[:user][:sport_ids].size >= 2
      @user.sport_users.each {|su| su.destroy! }
      params[:user][:sport_ids].each { |spo_id| SportUser.create(user: @user, sport: Sport.find(spo_id), skill_level: 'Intermediate') if spo_id != ""}
    end
    @user.update(user_params)
    redirect_to me_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :skill_level)
  end
end
