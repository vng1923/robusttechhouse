class StaticPagesController < ApplicationController
  def home
  	#@posts = Post.all
  	#@posts = Post.paginate(page: params[:page], per_page: 5).order(created_at: :desc)

  	if params[:id]

  		puts params[:id]
      # get all records with id less than 'our last id'
      # and limit the results to 5
      @posts = Post.where('id > ?', params[:id]).limit(5)
    else
      @posts = Post.limit(5)
    end
    respond_to do |format|
      format.html
      format.js
    end
  	
  end
  def show
  	@post = Post.find(params[:id])
  	#@comments = @post.comments
  end
  def post_comment
  	puts params[:txtComment]
  	@comment = Comment.new
  	@comment.user_id = current_user.id
  	@comment.post_id = params[:post_id]
  	@comment.comment = params[:txtComment]
  	@comment.save
  	redirect_to action: "show", id: params[:post_id]
  end
end
