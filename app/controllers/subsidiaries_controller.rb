class SubsidiariesController < ApplicationController
    def index
      @subsidiaries = Subsidiary.all
      if Subsidiary.count == 0
        flash[:notice] = 'Nenhuma filial cadastrada'
        render :index
      end
    end
    def show
      id = params[:id]
      @subsidiary = Subsidiary.find(id)
    end 
  end
    