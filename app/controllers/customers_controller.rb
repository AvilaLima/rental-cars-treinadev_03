class CustomersController < ApplicationController
  def index 
    @customers = Customer.all
    if Customer.count == 0
      flash[:notice] = 'Nenhum cliente cadastrado'
      render :index
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = 'Cliente criado com sucesso'
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :document, :email)
  end
end