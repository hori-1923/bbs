class Api::V1::PostsController < ApplicationController

	skip_before_action :verify_authenticity_token

  def index
    @posts = Post.all
  end
  
  def create
  	#{post {title name body}}

  	@post = Post.new(post_params)

  	if @post.save 
  		head  :created
  	else
  		#head  :unprocessable_entity
  		render json: @post.errors.full_message, status: :unprocessable_entity
  	end
  	#render text: 'hello', status: 201
  end
  
  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params) 
  		head :ok
  	else
  		render json: @post.errors.full_message, status: :unprocessable_entity
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	head :ok
  end

  private 
  def post_params
  	params.require(:post).permit(:title, :name, :body)
  end
end