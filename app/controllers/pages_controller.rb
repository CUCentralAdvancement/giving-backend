# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show paths]
  include Pagy::Backend

  # GET /pages or /pages.json
  def index
    @pagy, @pages = pagy(policy_scope(Page).all.with_rich_text_content_and_embeds)
    authorize @pages
  end

  def paths
    @paths = Page.pluck(:slug)
    authorize :page, :paths?
  end

  # GET /pages/1 or /pages/1.json
  def show; end

  # GET /pages/new
  def new
    @page = Page.new
    authorize @page
  end

  # GET /pages/1/edit
  def edit; end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params)
    authorize @page

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = policy_scope(Page).friendly.find(params[:id])
    authorize @page
    redirect_to @page if params[:id] != @page.slug
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :slug, :content, :main_image, :published)
  end
end
