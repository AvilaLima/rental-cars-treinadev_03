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
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = 'Fabricante criado com sucesso'
      redirect_to @manufacturer
    else
      render :new
    end
  end

  def edit    
    @manufacturer = Manufacturer.find(params[:id])
  end
  
  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'Fabricante atualizado com sucesso'
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
      flash[:notice] = 'Fabricante excluído com sucesso'
    redirect_to manufacturers_path
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end  

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
  