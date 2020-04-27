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
      @subsidiary = Subsidiary.new(subsidiary_params)
      @subsidiary.save
      redirect_to @subsidiary
    end
    def show
      id = params[:id]
      @subsidiary = Subsidiary.find(id)
    end 

    def edit
      @subsidiary = Subsidiary.find(params[:id])
    end

    def update
      @subsidiary= Subsidiary.find(params[:id])
      if @subsidiary.update(subsidiary_params)
        flash[:notice]= 'Filial atualizada com sucesso'
        redirect_to @subsidiary
      else
        render :edit
      end 
    end

    def subsidiary_params
      params.require(:subsidiary).permit(:name, :cnpj,:address)
    end
  end
    