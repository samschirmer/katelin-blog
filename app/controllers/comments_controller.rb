class CommentsController < InheritedResources::Base
	before_action :authenticate_admin!, except: [:create]

	def edit
		@comment = Comment.find(params[:id])
	end

	def approve
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(approval: 1) 	
			flash[:success] = "Update successful!"
		else
			flash[:success] = "Update was unsuccessful!"
		end
    redirect_to post_path(@comment.post_id) 
	end

	def create
		@comment = Comment.new(comment_params) 
		@comment[:approval] = 0
		@comment[:deleted] = 0
	  if @comment.save
      flash[:success] = "Comment saved successfully!"
      redirect_to post_path(@comment.post_id) 
	  else 
      flash[:success] = @comment.errors.full_messages
    	redirect_to post_path(@comment.post_id) 
	  end	
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
      flash[:success] = "Comment successfully deleted!"
		end
    redirect_to post_path(@comment.post_id) 
	end 


  private

    def comment_params
      params.require(:comment).permit(:author, :email, :body, :post_id)
    end
end

