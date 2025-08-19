class CommitmentsController < ApplicationController
  before_action :set_week, only: [:create, :destroy]

  def create
    @commitment = current_user.commitments.build(week: @week)
    
    respond_to do |format|
      if @commitment.save
        format.html { redirect_to root_path, notice: "You've successfully committed to this week!" }
        format.json { render json: { status: 'committed', message: 'Successfully committed' } }
      else
        format.html { redirect_to root_path, alert: "Unable to commit to this week." }
        format.json { render json: { errors: @commitment.errors }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @commitment = current_user.commitments.find_by(week: @week)
    
    if @commitment
      @commitment.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "You've withdrawn your commitment." }
        format.json { render json: { status: 'uncommitted', message: 'Successfully uncommitted' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "No commitment found to withdraw." }
        format.json { render json: { error: 'No commitment found' }, status: :not_found }
      end
    end
  end

  private

  def set_week
    @week = Week.find(params[:week_id])
  end
end
