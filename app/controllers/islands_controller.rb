class IslandsController < ApplicationController
  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user_id = current_user.id
    if @island.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  def edit
    @island = Island.find(params[:id])
  end

  def show
    @island = Island.find(params[:id])
  end

  def update
    @island = Island.find(params[:id])
    @island.update(island_params)
    redirect_to island_path(@island)
  end

  private

  def island_params
    params.required(:island).permit(:name, :capacity, :description, :price, :location, :availability, :photo)
  end
end

# create migration adding "photo" to island table - DONE
# db:migrate - DONE
# complete new/.create/edit/show method - DONE
# upload function + install gem to upload photo to cloudinary
# set up views/islands/
