class UsersController < ApplicationController
  before_action :find_user, except: [:new, :index, :create]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "containt.init"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
  def find_user
    @user = User.find_by :id params[:id]
  end
end
