class CommentsController < ApplicationController
  before_action :load_commentable


  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comments_params)
      if @comment.save
        redirect_to @commentable, notice: "Comment created."
      else
        render :new
      end
  end

  def destroy
  end

  


  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end


  def comments_params
    params.require(:comment).permit(:content, :email, :name)
  end
end
