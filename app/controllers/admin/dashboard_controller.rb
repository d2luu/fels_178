class Admin::DashboardController < ApplicationController
  before_action :verify_admin

  def index
    @users = User.all
    @words = Word.all
    @categories = Category.all
  end
end
