class PetsController < ApplicationController
  respond_to :json

  def index
    respond_with Pet.all
  end

  def show
    respond_with Pet.find(params[:id])
  end

  def create
    respond_with Pet.create(pet_params)
  end

  def update
    respond_with Pet.update(params[:id], pet_params)
  end

  def destroy
    respond_with Pet.find(params[:id]).destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end

end
