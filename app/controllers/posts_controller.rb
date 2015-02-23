class PostsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @post = Post.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.build(post_params)

    if @post.save
      redirect_to [@blog, @post]
    else
      render 'new'
    end
  end

  def show
   @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end