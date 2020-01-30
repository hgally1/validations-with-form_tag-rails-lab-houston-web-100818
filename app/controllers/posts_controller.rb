class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.errors.messages.any?
      render :edit
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
