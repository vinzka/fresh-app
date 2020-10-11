class PlayersController < ApplicationController
  before_action :set_activity, only: :create

  def create
    @player = Player.new
    @player.activity = @activity
    @player.user = current_user
    if @player.save
      redirect_to activity_path(@activity), notice: 'You have joined'
    else
      render 'activities/show'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to activities_path, notice: 'You have left the activity'
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

end
