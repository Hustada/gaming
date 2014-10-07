class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def index
    @post = Post.all
    @posts = Post.order('created_at DESC')
    ##@posts_by_month = Post.find(:all, :order => 'created_at DESC').group_by { |post| post.created_at.strftime("%B %Y") }
  end
  

  def month_count
    @posts_by_month = Post.find(:all, :order => 'created_at DESC').group_by { |post| post.created_at.strftime("%B %Y") }
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end





end
