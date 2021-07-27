class RedirectsController < ApplicationController
  before_action :set_redirect, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show]
  include Pagy::Backend

  # GET /redirects or /redirects.json
  def index
    @pagy, @redirects = pagy(policy_scope(Redirect).all)
    authorize @redirects
  end

  # GET /redirects/1 or /redirects/1.json
  def show
  end

  # GET /redirects/new
  def new
    @redirect = Redirect.new
    authorize @redirect
  end

  # GET /redirects/1/edit
  def edit
  end

  # POST /redirects or /redirects.json
  def create
    @redirect = Redirect.new(redirect_params)
    authorize @redirect

    respond_to do |format|
      if @redirect.save
        format.html { redirect_to @redirect, notice: "Redirect was successfully created." }
        format.json { render :show, status: :created, location: @redirect }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redirects/1 or /redirects/1.json
  def update
    respond_to do |format|
      if @redirect.update(redirect_params)
        format.html { redirect_to @redirect, notice: "Redirect was successfully updated." }
        format.json { render :show, status: :ok, location: @redirect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @redirect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redirects/1 or /redirects/1.json
  def destroy
    @redirect.destroy
    respond_to do |format|
      format.html { redirect_to redirects_url, notice: "Redirect was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redirect
      @redirect = policy_scope(Redirect).find(params[:id])
      authorize @redirect
    end

    # Only allow a list of trusted parameters through.
    def redirect_params
      params.require(:redirect).permit(:source, :redirect, :expiration, :status)
    end
end
