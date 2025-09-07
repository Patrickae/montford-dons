class CommitmentsController < ApplicationController
  before_action :set_week, only: [:create, :destroy]
  before_action :set_commitment, only: %i[  update destroy ]

  def create
    @commitment = current_user.commitments.build(commitment_params)
    
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

  def update
    p params
    p commitment_params
    respond_to do |format|
      if @commitment.update(commitment_params)
        format.html { redirect_to root_path, notice: "Commitment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @commitment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commitment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def commitment_params
    params.expect(commitment: [ :status ])
  end

  def set_commitment

    @commitment = Commitment.find(params.expect(:id))
  end
end
