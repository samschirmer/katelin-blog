class PostsController < InheritedResources::Base

	def show
		@post = Post.find params[:id]
	end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end

