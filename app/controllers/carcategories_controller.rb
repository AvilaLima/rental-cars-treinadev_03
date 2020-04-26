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
    @carcategory = Carcategory.new(carcategory_params)
    @carcategory.save
    redirect_to @carcategory        
  end
  def show
    @carcategory = Carcategory.find(params[:id])
  end

  private

  def carcategory_params
    params.require(:carcategory).permit(:name, :daily_rate,:car_insurance,:third_party_insurance)
  end
end
