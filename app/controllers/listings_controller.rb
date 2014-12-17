class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find_by(id: params[:id])
  end

  def update
    @listing = Listing.find_by(id: params[:id])

    if @listing.update(listing_params)
      redirect_to current_user
    else
      render 'listings/edit'
    end
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      current_user.listings << @listing
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def destroy
    @listing = Listing.find_by(id: params[:id])
    @listing.destroy

    redirect_to current_user
  end

  def activate
    @listing = Listing.find_by(id: params[:id])
    @listing.active = true
    @listing.save

    redirect_to current_user
  end

  def deactivate
    @listing = Listing.find_by(id: params[:id])
    @listing.active = false
    @listing.save

    redirect_to current_user
  end

  private
    def listing_params
      params.require(:listing).permit(:description, :title, :desired, :image, :quantity, :active, :image, :item_id)
    end

end
