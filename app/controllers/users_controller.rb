class UsersController < ApplicationController
  before_action :find_user, except: [:new, :index, :create]
  def new
    @user = User.new
  end

  def index
    @users = User.paginate page: params[:page], per_page: Settings.page_size
  end

  def show
    @relationship = if current_user.following? @user
      current_user.active_relationships.find_by followed_id: @user.id
    else
      current_user.active_relationships.build
    end
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

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to user_path @user
    else
      flash[:danger] = t "containt.update_fails"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      redirect_to root_path
      flash[:danger] = t :user_fails
    end
  end
end
