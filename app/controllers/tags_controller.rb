class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    byebug
    @tag = Tag.find_or_create_by(name: params[:tag][:name])
    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end
end
