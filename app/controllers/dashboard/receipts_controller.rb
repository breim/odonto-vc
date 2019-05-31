# frozen_string_literal: true

# Extend module
module Dashboard
  # Controller
  class ReceiptsController < Dashboard::DashboardController
    before_action :set_receipt, only: %i[show edit update destroy]

    respond_to :html

    def index
      @receipts = if params[:year].present?
                    Receipt.where(user_id: current_user.id, deleted: false)
                           .where(date: "01/01/#{params[:year]}".to_date.beginning_of_day.."31/12/#{params[:year]}".to_date.end_of_day)
                           .order(created_at: :desc)
                  else
                    Receipt.where(user_id: current_user.id, deleted: false)
                           .order(created_at: :desc).paginate(page: params[:page])
                  end
      #respond_to do |format|
      #  format.html
        #format.xls { headers['Content-Disposition'] = "attachment; filename=\"#{params[:date][:year]}.xls\"" }
      #end
    end

    def show
      respond_with(:dashboard, @receipt)
    end

    def new
      @receipt = Receipt.new
      respond_with(:dashboard, @receipt)
    end

    def edit; end

    def create
      @receipt = Receipt.new(receipt_params)
      @receipt.user_id = current_user.id
      @receipt.save
      respond_with(:dashboard, @receipt)
    end

    def update
      @receipt.update(receipt_params)
      respond_with(:dashboard, @receipt)
    end

    def destroy
      @receipt.update(deleted: true)
      respond_with(:dashboard, @receipt, location: dashboard_receipts_path)
    end

    private

    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    def receipt_params
      params.require(:receipt).permit(:name, :cpf, :customer_name, :customer_cpf, :total, :services, :location, :date)
    end
  end
end
