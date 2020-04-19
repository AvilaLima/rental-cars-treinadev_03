class CarcategoriesController < ApplicationController
    def index
        @carcategories = Carcategory.all
        if Carcategory.count == 0
          flash[:notice] = 'Nenhuma categoria de carro cadastrada'
          render :index
        end
    end
    def new
        @carcategory = Carcategory.new
    end
    def create
        @carcategory = Carcategory.new
        @carcategory.name = params[:carcategory][:name]
        @carcategory.daily_rate = params[:carcategory][:daily_rate]
        @carcategory.car_insurance = params[:carcategory][:car_insurance]
        @carcategory.third_party_insurance = params[:carcategory][:third_party_insurance]
        @carcategory.save
        redirect_to @carcategory        
    end
    def show
        id= params[:id]
        @carcategory = Carcategory.find(id)
    end
end