class NameBadgesController < ApplicationController
  def show
    @name_badge = NameBadge.find(params[:id])
  end

  def edit
    @name_badge = NameBadge.find(params[:id])
  end

  def update
    @name_badge = NameBadge.find(params[:id])
    if @name_badge.update_attributes(params[:name_badge])
      redirect_to @name_badge, :notice => "Se ha actualizado el gafete."
    else
      flash[:alert] = "No se pudo actualizar el gafete."
      render 'edit'
    end
  end

  def index
    @name_badges = NameBadge.all
  end
end
