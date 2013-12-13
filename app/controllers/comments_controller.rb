class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end
	
	def new
		@comment = current_user.comments.new
		#@pin = Pin.find(params[:id])
		
		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @comment }
		end
	end
	
	def create
		#@post = Post.new(params[:post])
		@comment = current_user.comments.new(params[:comment])
		@pin = Pin.find(@comment.pin_id)
		#@comment.pin_id=@pin.id
		if @comment.save
			redirect_to @pin
		else
			render 'new'
		end
	end
	
	def show
		@comment = Comment.find(params[:id])
	end
	
	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		redirect_to comments_path
	end
	
	def comment
	end
	
	def edit
		@comment = Comment.find(params[:id])
	end
	
	def update
		@comment = Comment.find(params[:id])
		if (@comment.update_attributes(params[:comment]))
			redirect_to @comment
		else
			render 'edit'
		end
	end

	private
	def comment_params
		params.require(:pins).permit(:pin_id, :integer)
	end
end
