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
end