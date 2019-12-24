class PetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pets = Pet.all

  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = current_user.pets.new
    # {name:nil,number:nil,user_id:3}
  end

  def create
    # debugger
    @pet = current_user.pets.new(pet_params)
    # {name:'sdss',number:'04434'}
    if @pet.save
      redirect_to root_path
    else
      redirect_to new_pet_path
    end
    
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
    def set_car
      @pet = Pet.find(params[:id])
    end
   
    def pet_params
      params.require(:pet).permit( :name, :number, :age, :img, :description)
    end

end
