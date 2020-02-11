class PublicController < ApplicationController
  def index
    @posts = Post.includes(:category).where(published: true).order(created_at: :desc)
  end
end
