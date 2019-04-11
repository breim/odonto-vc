# frozen_string_literal: true

# Extend module
module Admin
  # Controller
  class TicketsController < Admin::AdminController
    before_action :set_ticket, only: %i[show edit update]

    respond_to :html

    def index
      @tickets = if params[:search]
                   Ticket.search(params[:search]).paginate(page: params[:page])
                 else
                   Ticket.paginate(page: params[:page]).order(created_at: :desc)
                 end
      respond_with(@tickets)
    end

    def show
      respond_with(@ticket)
    end

    def edit; end

    def update
      @ticket.update(ticket_params)
      respond_with(@ticket, location: admin_tickets_path)
    end

    def destroy; end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:solved)
    end
  end
end
