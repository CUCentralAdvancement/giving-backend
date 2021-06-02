class FundsController < ApplicationController
  before_action :set_fund, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!
  include Pagy::Backend

  # GET /funds or /funds.json
  def index
    @pagy, @funds = pagy(Fund.order(created_at: :desc))
  end

  def paths
    @paths = Fund.pluck(:slug)
  end

  # GET /funds/1 or /funds/1.json
  def show
  end

  # GET /funds/new
  def new
    @fund = Fund.new
  end

  # GET /funds/1/edit
  def edit
  end

  # POST /funds or /funds.json
  def create
    @fund = Fund.new(fund_params)

    respond_to do |format|
      if @fund.save
        format.html { redirect_to @fund, notice: "Fund was successfully created." }
        format.json { render :show, status: :created, location: @fund }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funds/1 or /funds/1.json
  def update
    respond_to do |format|
      if @fund.update(fund_params)
        format.html { redirect_to @fund, notice: "Fund was successfully updated." }
        format.json { render :show, status: :ok, location: @fund }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funds/1 or /funds/1.json
  def destroy
    @fund.destroy
    respond_to do |format|
      format.html { redirect_to funds_url, notice: "Fund was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fund
    @fund = Fund.friendly.find(params[:id])
    if params[:id] != @fund.slug
      redirect_to @fund
    end
  end

  # Only allow a list of trusted parameters through.
  def fund_params
    params.require(:fund).permit(:title, :slug, :fund_owners, :description, :marketing_content,
                                 :marketing_content_expiration, :allocation_code,
                                 :suggested_amount, :featured_fund, :active, :campus, :keywords,
                                 :interest, :fund_type)
  end
end
