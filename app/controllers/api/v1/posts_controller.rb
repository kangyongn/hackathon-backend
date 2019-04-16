class Api::V1::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create

    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors.full_messages , status: :unprocessable_entity
    end
  end

  def update
    @post.update(post_params)
    if @post.save
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    render json: @post
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :content, :assigned_to)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
