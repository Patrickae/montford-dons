class ChargeTypesController < ApplicationController
  before_action :set_charge_type, only: %i[ show edit update destroy ]

  # GET /charge_types or /charge_types.json
  def index
    @charge_types = ChargeType.all
  end

  # GET /charge_types/1 or /charge_types/1.json
  def show
  end

  # GET /charge_types/new
  def new
    @charge_type = ChargeType.new
  end

  # GET /charge_types/1/edit
  def edit
  end

  # POST /charge_types or /charge_types.json
  def create
    @charge_type = ChargeType.new(charge_type_params)

    respond_to do |format|
      if @charge_type.save
        format.html { redirect_to @charge_type, notice: "Charge type was successfully created." }
        format.json { render :show, status: :created, location: @charge_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @charge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charge_types/1 or /charge_types/1.json
  def update
    respond_to do |format|
      if @charge_type.update(charge_type_params)
        format.html { redirect_to @charge_type, notice: "Charge type was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @charge_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @charge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charge_types/1 or /charge_types/1.json
  def destroy
    @charge_type.destroy!

    respond_to do |format|
      format.html { redirect_to charge_types_path, notice: "Charge type was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_type
      @charge_type = ChargeType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def charge_type_params
      params.expect(charge_type: [ :name, :amount, :frequency ])
    end
end
