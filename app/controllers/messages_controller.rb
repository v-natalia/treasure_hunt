# app/controllers/messages_controller.rb

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation

  # POST /donations/:donation_id/messages
  def create
    @message          = Message.new(message_params)
    @message.user     = current_user
    @message.donation = @donation

    if @message.save
      redirect_to @donation, notice: "Message envoyé."
    else
      redirect_to @donation, alert: @message.errors.full_messages.join(", ")
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:donation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
