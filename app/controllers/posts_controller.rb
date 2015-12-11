class PostsController < ApplicationController

    before_action :authenticate_user!, :except => [:index, :show]

    #index of posts for current user
	def index
		@all_posts = Post.all
    # @atom_posts = Post.find_by title: 'Atom'
    # @search_results = Post.where(title: "#{@search}")
	end
  
	def profile
		if current_user
			@current_user_posts = current_user.posts
		else
			@current_user_posts = Post.all
		end
		@current_user_answers = current_user.comments

		# @post = Post.find(params[:id])

	end


	# retrieve a single post and render the show page
	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = Comment.new
	end

	#loads page for a new post
	def new
		@post = Post.new
	end

	#action to create a new post once it is submitted
	def create
		@post = Post.new(create_params)
		if @post.save
			redirect_to post_path(@post), notice: "Question Created Succesfully."
		else
			redirect_to :back, flash: "Aw Snap! Error saving Question. Try again Later."
		end
	end

    # post params sanitization
	def create_params
		params.require(:post).permit(:title, :body, :user_id)
	end

    #comments:
	def new_comment
		@comment = Comment.new
	end

	# delete post
	def destroy
		@post = Post.find(params[:id])
		if @post.delete
			redirect_to "/posts", notice: "Question Deleted"
		else
			redirect_to "/posts/profile", notice: "Error deleting Question, please try again."
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	@post = Post.find(params[:id])
		if @post.update_attributes(create_params)
			redirect_to post_path(@post), notice: "Post updated"
		else
			redirect_to :back, notice: "Error updating Post."
		end
	end

end
