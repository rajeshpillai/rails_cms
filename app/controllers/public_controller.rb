class PublicController < ApplicationController
  def index
    @posts = Post.includes(:category).where(published: true).order(created_at: :desc)
  end

  def search
    # @posts = Category.where(:title => params[:category_slug])
    @posts = Post.select('posts.*')
          .joins(:category)
          .where('lower(categories.slug)=lower(?)',params[:category_slug])
    render "public/index"
  end
end
