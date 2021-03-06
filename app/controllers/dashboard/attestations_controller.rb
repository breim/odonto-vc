# frozen_string_literal: true

# Extend module
module Dashboard
  # Controller
  class AttestationsController < Dashboard::DashboardController
    before_action :set_attestation, only: %i[show edit update destroy]

    respond_to :html, :flash

    def index
      @attestations = if params[:search].present?
                        Attestation.where(user_id: current_user.id, deleted: false).search(params[:search])
                                   .paginate(page: params[:page])
                      else
                        Attestation.where(user_id: current_user.id, deleted: false).order(created_at: :desc)
                                   .paginate(page: params[:page])
                      end

      respond_with(:dashboard, @attestations)
    end

    def show
      respond_with(@attestation, location: dashboard_attestation_path(@attestation))
    end

    def new
      @attestation = Attestation.new
      respond_with(:dashboard, @attestation)
    end

    def edit; end

    def create
      @attestation = Attestation.new(attestation_params)
      @attestation.user_id = current_user.id
      @attestation.save
      respond_with(:dashboard, @attestation)
    end

    def update
      @attestation.update(attestation_params)
      respond_with(:dashboard, @attestation)
    end

    def destroy
      @attestation.update(deleted: true)
      respond_with(@attestation, location: dashboard_attestations_path)
    end

    private

    def set_attestation
      @attestation = Attestation.find(params[:id])
    end

    def attestation_params
      params.require(:attestation).permit(:name, :address, :work_or_study, :customer_id, :customer_name, :date, :hour,
                                          :fit_unfit, :unfit_days, :observation, :cro, :company)
    end
  end
end
