# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /memberships or /memberships.json
  def index
    @memberships = policy_scope(Membership).all
    authorize @memberships
  end

  # GET /memberships/1 or /memberships/1.json
  def show; end

  # GET /memberships/new
  def new
    @membership = Membership.new
    authorize @membership
  end

  # GET /memberships/1/edit
  def edit; end

  # POST /memberships or /memberships.json
  def create
    # Add user and space from form.
    user = User.find_by(email: membership_params[:user])
    space = Space.find_by(name: membership_params[:space])

    new_params = membership_params
    new_params[:user] = user
    new_params[:space] = space
    new_params[:level] = membership_params[:level].to_i

    # byebug

    @membership = Membership.new(new_params)
    authorize @membership

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1 or /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1 or /memberships/1.json
  def destroy
    space = @membership.space
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to space_path(space), notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_membership
    @membership = policy_scope(Membership).find(params[:id])
    authorize @membership
  end

  # Only allow a list of trusted parameters through.
  def membership_params
    params.require(:membership).permit(:level, :aasm_state, :start_date, :end_date, :space, :user)
  end
end
