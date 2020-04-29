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

  def edit
    @carcategory = Carcategory.find(params[:id])
  end

  def update
    @carcategory = Carcategory.find(params[:id])
    if @carcategory.update(carcategory_params)
      flash[:notice]= 'Categoria atualizada com sucesso'
      redirect_to @carcategory
    else
      render :edit
    end
  end
  private

  def carcategory_params
    params.require(:carcategory).permit(:name, :daily_rate,:car_insurance,:third_part_insurance)
  end
end
