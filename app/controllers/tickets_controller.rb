# Controller
class TicketsController < ApplicationController
  respond_to :html, :js

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    respond_with(:dashboard, @ticket)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :phone, :description, :user_id)
  end
end
