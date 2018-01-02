class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.find_or_create_by(name: params[:tag][:name].downcase)
    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end

  def show
      tag = Tag.find(params[:id])
      @posts = Post.paginate(:page => params[:page], :per_page => 12)
      @posts = @posts.all.select {|p|
        p.tags.include?(tag)}
  end
end
