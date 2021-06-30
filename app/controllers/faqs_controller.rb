class FaqsController < ApplicationController
  before_action :set_faq, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show, :paths]
  include Pagy::Backend

  # GET /faqs or /faqs.json
  def index
    @pagy, @faqs = pagy(Faq.order(created_at: :desc))
    authorize @faqs
  end

  def paths
    @paths = Faq.pluck(:slug)
    authorize :faq, :paths?
  end

  # GET /faqs/1 or /faqs/1.json
  def show
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
    authorize @faq
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs or /faqs.json
  def create
    @faq = Faq.new(faq_params)
    authorize @faq

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: "Faq was successfully created." }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1 or /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: "Faq was successfully updated." }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1 or /faqs/1.json
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: "Faq was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = policy_scope(Faq).friendly.find(params[:id])
      authorize @faq
      if params[:id] != @faq.slug
        redirect_to @faq
      end
    end

    # Only allow a list of trusted parameters through.
    def faq_params
      params.require(:faq).permit(:title, :slug, :category, :content)
    end
end
