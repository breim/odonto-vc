# frozen_string_literal: true

# Extend module
module Dashboard
  # Controller
  class ConsultationsController < Dashboard::DashboardController
    before_action :set_consultation, only: %i[show edit update destroy]

    respond_to :html, :js, :json

    def index
      @consultations = Consultation.joins(:user, :customer).where(consultations: { user_id: current_user.id, canceled: false })
                                   .where(consultations: { date: params[:start].to_date.beginning_of_day..params[:end].to_date.end_of_day })#.decorate
                                   .select('*, consultations.id AS consultation_id, customers.name AS customer_name')
      respond_with(@consultations)
    end

    def show
      respond_with(@consultation)
    end

    def new
      @consultation = Consultation.new
      @customer = Customer.find(params[:customer_id]).decorate
      respond_with(@consultation)
    end

    def edit
      @customer = Consultation.find(@consultation.id).customer.decorate
    end

    def create
      @consultation = Consultation.new(consultation_params)
      @consultation.user_id = current_user.id
      @consultation.save
      respond_with(@consultation)
    end

    def update
      @consultation_save_responder = @consultation.update(consultation_params)
      respond_with(@consultation)
    end

    def destroy
      @consultation.update(canceled: true)
      respond_with(@consultation)
    end

    private

    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    def consultation_params
      params.require(:consultation).permit(:customer_id, :date, :hour, :duration, :annotation)
    end
  end
end
