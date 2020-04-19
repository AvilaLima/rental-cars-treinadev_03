class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    if Manufacturer.count == 0
      flash[:notice] = 'Nenhum fabricante cadastrado'
      render :index
    end
  end
  def new
    @manufacturer = Manufacturer.new
  end
  def create
    @manufacturer = Manufacturer.new(params.require[:manufacturer].permit(:name))
    @manufacturer.save
    redirect_to @manufacturer
  end
  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end 
end
  