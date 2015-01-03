class UsersController < ApplicationController

  def index
    redirect_to current_user
  end

  def show
    @listing = Listing.new
    @user = User.find_by(id: params[:id])
    @items= Item.all
  end

  def create
    @user = User.find_by(id: params[:id])
    if @user.update(update_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(update_params)
      redirect_to current_user
  end

private
    def update_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :address_line_1, :city, :state, :zipcode, :about, :user_img, :phone, :private_contact, :password, :password_confirmation)
    end

end
