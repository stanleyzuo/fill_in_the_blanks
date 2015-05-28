class PostsController < ApplicationController
	# BONUS! Learn how to use a before_action to keep your controller DRY

	def index
		# create an instance variable that points to all of our posts
		# there are already some seeded posts, get them to show up in your app
		@posts = Post.all.order(:bru_name)
	end

	def new
		# instantiate an empty (new) Post
		@post = Post.new
	end

	def create
		# create a Post and save it into the database
		# redirect to the new Post
		@post = Post.new (post_params)

		if @post.save 
		redirect_to @post
	else
		render 'new'
	end
	end

	def show
		# assign an instance variable to the post with id from params
		@post = Post.find params[:id]
	end

	def edit
		# assign an instance variable to the post with id from params
		@post = Post.find(params[:id])
	end

	def update
		# update the instance variable from our edit page
		# redirect to the updated post
		@post = Post.find(params[:id])

	if @post.update(post_params)
		redirect_to @post
	else
		render 'edit'
	end 
	end

	def destroy
		# assign an instance variable to the post with id from params
		# destroy the post
		# redirect to index
		@post =Post.find(params[:id])
	@post.destroy

	redirect_to posts_path
	end 

private
	def post_params
		# fill in with strong parameters
		params.require(:post).permit(:title, :body, :bru_name)
	end
end
