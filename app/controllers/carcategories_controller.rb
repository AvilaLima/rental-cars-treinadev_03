class CarcategoriesController < ApplicationController
    def index
        @carcategories = Carcategory.all
        if Carcategory.count == 0
          flash[:notice] = 'Nenhuma categoria de carro cadastrada'
          render :index
        end
    end
    def show
        id= params[:id]
        @carcategory = Carcategory.find(id)
    end
end