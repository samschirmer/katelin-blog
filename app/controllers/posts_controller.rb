class PostsController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :show]


	def index
		# this is using raw sql and NOT accounting for status yet
		@posts = Post.index
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where(post_id: params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params) 
	  if @post.save
      flash[:success] = "Post saved successfully!"
      redirect_to posts_path
	  else 
      flash[:success] = @post.errors.full_messages
    	redirect_to posts_path 
	  end	
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		# hack to account for slugs
		id = params[:id].split('-')[0]
		@post = Post.find(id)
		if @post.destroy
      flash[:success] = "Post successfully deleted!"
    	redirect_to posts_path 
	  else 
      flash[:success] = @post.errors.full_messages
    	redirect_to posts_path 
		end
	end


=begin
	def new
		if logged_in?
			@menu_item = MenuItem.new
		else
			redirect_to root_path
		end
	end
=end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end

