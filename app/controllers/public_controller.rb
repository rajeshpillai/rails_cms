class PublicController < ApplicationController
  before_action :authenticate_user!, only: [:comments]
  def index
    @posts = Post.includes(:category).where(published: true).order(created_at: :desc)
  end

  def search
    # @posts = Category.where(:title => params[:category_slug])
    if params.has_key?(:category_slug)
      @posts = Post.select('posts.*')
            .joins(:category)
            .where('lower(categories.slug)=lower(?)',params[:category_slug])
    elsif params.has_key?(:tag)
      @posts = Post.select('posts.*')
            .joins(:tags)
            .where('lower(tags.name)=lower(?)',params[:tag])
    end
    render "public/index"
  end

  def read
    @post = Post.find(params[:post_id])
    render "public/posts/read"
  end

  def comments
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save

    redirect_to post_read_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :title, :content)
  end
end
