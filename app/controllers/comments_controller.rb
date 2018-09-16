class CommentsController < ApplicationController
  def create
		# @post = Post.find(params[:post_id])
		# @comment = @post.comments.create(params[:comment].permit(:name, :body))
		@comment = Comment.new
		@comment.name = params['name']
		@comment.body = params['body']
		@comment.post_id = params['post_id']
		@comment.save


    respond_to do |format|
      format.json { render json: @comment }
    end
  end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		# @comment = Comment.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)

	end

end
