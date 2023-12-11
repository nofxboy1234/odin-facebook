class PostsController < ApplicationController
  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc).select do |post|
      authored_by_current_user_or_friend?(post)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :author_id)
  end

  def authored_by_current_user_or_friend?(post)
    post.author.eql?(current_user) ||
      current_user.friends_with?(post.author)
  end
end
