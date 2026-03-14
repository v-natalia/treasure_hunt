# app/controllers/donations_controller.rb

class DonationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_donation,       only: [:show, :edit, :update, :destroy, :mark_as_given]
  before_action :authorize_user!,    only: [:edit, :update, :destroy]

  # GET /donations
  def index
    @donations = Donation.all
                         .by_category(params[:category])
                         .by_condition(params[:condition])
                         .recent
                         .page(params[:page]).per(12)
  end

  # GET /donations/:id
  def show
    @messages = @donation.messages.recent
    @message  = Message.new
    @review   = Review.new
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # POST /donations
  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    if @donation.save
      current_user.update_hunter_level!
      redirect_to @donation, notice: "Votre trésor a été publié !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /donations/:id/edit
  def edit
  end

  # PATCH /donations/:id
  def update
    if @donation.update(donation_params)
      redirect_to @donation, notice: "Don mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /donations/:id
  def destroy
    @donation.destroy
    redirect_to donations_path, notice: "Don supprimé."
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Accès refusé." unless @donation.user == current_user
  end

  def donation_params
    params.require(:donation).permit(
      :name, :category, :description,
      :condition, :availability, :address
    )
  end
end
