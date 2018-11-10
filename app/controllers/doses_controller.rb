class DosesController < ApplicationController

  before_action :find_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :instructions)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

end
