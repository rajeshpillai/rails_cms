class PublicController < ApplicationController
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
end
