class CarsController < ApplicationController
  def index
    @cars = Car.all
    if Car.count== 0
      flash[:notice] = 'Nenhum carro cadastrado'
      render :index
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @subsdiaries = Subsidiary.all
    @car_models = CarModel.all
  end

  def create
    @car = Car.create(car_params)
    if @car.save!
      flash[:notice] = 'Carro criado com sucesso'
      redirect_to cars_path
    else
      @subsdiaries = Subsidiary.all
      @car_models = CarModel.all
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:license_plate,:color,:subsidiary_id,:mileage,:car_model_id)
  end  
end
