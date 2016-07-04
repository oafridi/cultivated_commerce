class UsersController < ApplicationController

  def index
    redirect_to current_user
  end

  def show
    @listing = Listing.new
    @user = User.find_by(id: params[:id])

    @events = @user.events
    @hosted_events = @user.hosted_events
    @items = Item.all
    @listings = @user.listings
  end

  def create
    if User.find_by(id: params[:id])
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def update
    User.update(params[:id], update_params)
    redirect_to current_user
  end

  private
  def update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,
                                 :address_line_1, :city, :state, :zipcode, :about, :img, :phone,
                                 :private_contact, :password, :password_confirmation)
  end

end
