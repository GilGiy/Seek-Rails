class CommentsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(create_params)
		if @comment.save
			redirect_to "/", notice: "Answer Created Succesfully."
		else
			redirect_to :back, flash: "Aw Snap! Error saving Answer. Try again Later."
		end
	end

	def create_params
		params.require(:comment).permit(:content, :post_id, :user_id)
	end
end
