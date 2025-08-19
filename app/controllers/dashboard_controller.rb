class DashboardController < ApplicationController
  before_action :set_current_week, only: [:index, :current_week]

  def index
    @current_week = Week.current
    if @current_week
      @committed_users = @current_week.committed_users.includes(:commitments)
      @user_committed = current_user.committed_to?(@current_week)
    else
      @committed_users = []
      @user_committed = false
    end
  end

  def admin
  end

  def calendar
    @weeks = Week.all
  end

  def current_week
  end

  private

  def set_current_week
    @current_week = Week.current
  end
end
