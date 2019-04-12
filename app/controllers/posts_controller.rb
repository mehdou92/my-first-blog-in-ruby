class PostsController < ApplicationController

	before_action :set_post, only: [:show, :update, :destroy]

	# GET /posts
	def index
		@posts = Post.all

		render json: @posts, status: :success #200
	end

	#GET /posts/id
	def show

		render json: @post
	end

	#POST /posts
	def create
		@post = Post.new(params.permit(:title, :content))

		if @post.save
			render json: @post, status: :created, location: @post
		else
			render json: @post.errors, status: :bad_request #400
		end
	end


	#PATH / PUT / posts/:id
	def update

		if @post.update(post_params)
			render json: @post, status: :success
		else
			render json: @post.errors, status: :unprocessable_entity #422
		end
	end

	#DELETE /posts/:id

	def destroy
		@post.destroy
	end

	
	def set_post
		@post = Post.find(params[:id])
	end

	
	def post_params
		params.permit(:title, :content)
	end







end