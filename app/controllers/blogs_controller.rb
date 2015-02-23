class BlogsController < ApplicationController
  def index
    @blog = Blog.where(user_id: current_user)

  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @post = Post.where(blog_id: @blog)
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description)
  end

end