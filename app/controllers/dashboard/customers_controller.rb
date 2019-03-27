# Extend module
module Dashboard
  # Controller
  class CustomersController < Dashboard::DashboardController
    before_action :set_customer, only: %i[show edit update destroy]

    respond_to :html, :js, :json

    def index
      params[:page] = 1 unless params[:page].present?
      @customers = if params[:search].present?
                     Customer.joins(:user).where(user_id: current_user.id, deleted: false).search(params[:search])
                             .paginate(page: params[:page]).decorate
                   else
                     Customer.joins(:user).where(user_id: current_user.id, deleted: false)
                             .order(created_at: :desc).paginate(page: params[:page]).decorate
                   end
      respond_with(@customers, location: dashboard_customers_path)
    end

    def show
      respond_with(@customer)
    end

    def new
      @customer = Customer.new
      respond_with(@customer, location: dashboard_customers_path)
    end

    def edit
      # @odontograms = Odontogram.where(customer_id: @customer.id, user_id: current_user.id, disabled: false).order('created_at desc')
      respond_with(@customer)
    end

    def create
      @customer = Customer.new(customer_params)
      @customer.user_id = current_user.id
      @customer.save
      respond_with(@customer, location: dashboard_customers_path)
    end

    def update
      @customer.update(customer_params)
      @customer.save
      respond_with(@customer, location: dashboard_customers_path)
    end

    def destroy
      @customer.update(deleted: true)
      respond_with(@customer, location: dashboard_customers_path)
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
      return false if current_user.id != @customer.user_id
    end

    def customer_params
      params.require(:customer).permit(:name, :birthday, :gender, :code, :email, :celphone, :phone, :zipcode, :address,
                                       :number, :distric, :state, :city, :complement, :cpf, :annotation, :image, :image_base64)
    end
  end
end
