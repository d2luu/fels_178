class Admin::CategoriesController < ApplicationController
  before_action :find_catecory, only: :show

  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.page
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_root_path
      flash[:success] = t "categories.success"
    else
      flash[:danger] = t "categories.create_fails"
      render :new
    end    
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end

  def find_catecory
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "categories.empty"
      redirect_to admin_root_path
    end
  end
end
