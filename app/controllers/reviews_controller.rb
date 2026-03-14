# app/controllers/reviews_controller.rb

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation

  # POST /donations/:donation_id/reviews
  def create
    @review          = Review.new(review_params)
    @review.user     = current_user
    @review.donation = @donation

    if @review.save
      redirect_to @donation, notice: "Merci pour votre avis !"
    else
      redirect_to @donation, alert: @review.errors.full_messages.join(", ")
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:donation_id])
  end

  def review_params
    params.require(:review).permit(:points, :comment, :role)
  end
end
