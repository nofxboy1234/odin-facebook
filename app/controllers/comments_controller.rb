class CommentsController < ApplicationController
  # GET /comments/new
  def new
    @post_id = comment_params[:post_id]
    @comment = Comment.new
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      # params.fetch(:comment, {})
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
