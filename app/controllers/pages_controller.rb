require 'date'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home], :raise => false

  def home
  end

  def dashboard
    @activities = current_user.activities_joined
    if params[:query]
      if params[:query] == "joined"
        @activities = @activities.select{|activity|activity.start_time >= Time.now}
      end
       if params[:query] == "past"
        @activities = @activities.select{|activity|activity.start_time < Time.now}
      end
      if params[:query] == "created"
        @activities = current_user.activities
      end
    end
  end
end
