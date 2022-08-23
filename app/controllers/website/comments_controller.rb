class Website::CommentsController < WebsiteController
  def create
    @comment = Comment.new comment_params
    if @comment.save
      @comments = Comment.latest.find_comment @comment.book_id
      ActionCable.server.broadcast "comment_channel",
                                   {message: params[:comment]}
      respond_to do |format|
        format.js do
          render "website/products/show"
        end
      end
    else
      ActionCable.server.broadcast "comment_channel",
                                   {message: params[:comment]}
    end
  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :book_id, :content, :parent_id
  end
end
