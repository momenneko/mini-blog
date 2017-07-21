# -*- coding: utf-8 -*-
class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.all.reverse_order
    # 定義しておかないとif @post.errors.anyで例外が発生する
    @post = Post.new
  end

  # GET /posts/new
  #def new
  #  @post = Post.new
  #end

  # POST /posts
  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      # 無効なpost
      @posts = Post.all.reverse_order
      render :index, status: :unprocessable_entity
    end
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # POST /posts/:id/like
  def like
    @post = Post.find(params[:id])
    @post.increment(:like, 1)
    if @post.save
      redirect_to @post
    else
      render :index
    end
  end

  private
  def post_params
    # セキュリティの問題により，パラメータの値を明示する必要がある
    params.require(:post).permit(:text,:like)
  end
end
