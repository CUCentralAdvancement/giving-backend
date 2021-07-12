# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_space, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /spaces or /spaces.json
  def index
    @spaces = policy_scope(Space).all
    authorize @spaces
  end

  # GET /spaces/1 or /spaces/1.json
  def show; end

  # GET /spaces/new
  def new
    @space = Space.new
    authorize @space
  end

  # GET /spaces/1/edit
  def edit; end

  # POST /spaces or /spaces.json
  def create
    @space = Space.new(space_params)
    authorize @space

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_space
    @space = policy_scope(Space).find(params[:id])
    authorize @space
  end

  # Only allow a list of trusted parameters through.
  def space_params
    params.require(:space).permit(:name, :description, :slug)
  end
end
