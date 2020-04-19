class SubsidiariesController < ApplicationController
    def index
      @subsidiaries = Subsidiary.all
      if Subsidiary.count == 0
        flash[:notice] = 'Nenhuma filial cadastrada'
        render :index
      end
    end
    def new
      @subsidiary = Subsidiary.new 
    end
    def create
      @subsidiary = Subsidiary.new
      @subsidiary.name = params[:subsidiary][:name]
      @subsidiary.cnpj = params[:subsidiary][:cnpj]      
      @subsidiary.address = params[:subsidiary][:address]
      @subsidiary.save
      redirect_to @subsidiary
    end
    def show
      id = params[:id]
      @subsidiary = Subsidiary.find(id)
    end 
  end
    