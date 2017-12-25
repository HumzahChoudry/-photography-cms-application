class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.find_or_create_by(name: params[:category][:name])

    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end
end
