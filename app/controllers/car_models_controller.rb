class CarModelsController < ApplicationController
	def index
		@car_models = CarModel.all
		if CarModel.count == 0
			flash[:notice] = 'Nenhum modelo de carro cadastrado'
			render :index
		end
	end
	def show
		@car_model = CarModel.find(params[:id])
	end

	def new
		@car_model= CarModel.new
		@manufacturers = Manufacturer.all
		@carcategories = Carcategory.all
	end

	def create
		@car_model = CarModel.new(car_model_params)
		@car_model.save
		redirect_to @car_model
	end

	private

	def car_model_params
		params.require(:car_model).permit(:name,:motorization,:year,:fuel_type,:manufacturer_id,:carcategory_id)
	end

end