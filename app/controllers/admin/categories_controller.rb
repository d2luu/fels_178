class Admin::CategoriesController < ApplicationController
  before_action :find_catecory, except: [:index, :new, :create]

  def index
    @categories = Category.paginate page: params[:page], per_page: Settings.page
  end

  def new
    @category = Category.new
  end

  def show
    @words = @category.words
    @words = @words.paginate(page: params[:page]).per_page Settings.page_size
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = t "categories.success"
    else
      flash[:danger] = t "categories.create_fails"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "categories.update"
      redirect_to admin_category_path @category
    else
      flash[:danger] = t "flash.fail"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "categories.deleted"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_categories_path
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
