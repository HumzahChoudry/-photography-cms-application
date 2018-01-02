class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.find_or_create_by(name: params[:category][:name].downcase)

    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    @posts = Post.paginate(:page => params[:page], :per_page => 12)

    @posts = @posts.all.select {|p| p.category == category}
  end
end
