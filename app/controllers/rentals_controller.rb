class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
    if Rental.count == 0
      flash[:notice] = 'Nenhuma locação cadastrada'
      render :index
    end
  end

  def new
    @rental = Rental.new
    @customers = Customer.all
    @car_categories = Carcategory.all
  end

  def create 
    @rental = Rental.create(rental_params)
    if @rental.save!
      flash[:notice] = 'Locação criada com sucesso'      
      redirect_to rentals_path
    else
      @customers = Customer.all
      @car_categories = Carcategory.all
      render :new
    end
  end

  private 
  def rental_params
    params.require(:rental).permit(:start_date,:end_date,:customer_id,
      :carcategory_id)
  end
end