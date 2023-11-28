class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  respond_to :html

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with(@post)
  end

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def edit; end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy!
    respond_with(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :author_id)
  end
end
