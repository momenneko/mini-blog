# -*- coding: utf-8 -*-
class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    # 定義しておかないとnew.html.erbが表示されるときにnilになって例外が発生する
    @post = Post.new
  end

  # POST /posts
  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      # 無効なpost
      render :new, status: :unprocessable_entity
    end
  end


  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    # セキュリティの問題により，パラメータの値を明示する必要がある
    params.require(:post).permit(:title, :text)
  end
end
