class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pet = Pet.all

  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @pet = current_user.pets.new
  end

  def create
    @pet = current_user.pets.new (pet_params)
    redirect_to pets_path (@pet)
  end

  def update 
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pets_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit( :name, :number, :age, :img)
    end

end
