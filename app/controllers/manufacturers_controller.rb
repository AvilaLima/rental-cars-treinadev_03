class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    if Manufacturer.count == 0
      flash[:notice] = 'Nenhum fabricante cadastrado'
      render :index
    end
  end
  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end 
end
  