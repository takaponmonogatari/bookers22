class UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :update]
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user succesfully."
    else
      render :edit
      flash[:alert]
    end
  end


  private
  def ensure_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
