class PostsController < ApplicationController
  # GET /posts/new
  def new
  end

  # POST /posts
  def create
    render text: "params[:post].inspect"
  end
end
