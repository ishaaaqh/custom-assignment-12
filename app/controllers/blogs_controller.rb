class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @blogs = Blog.all
  end
  
  def userblogs
    @blogs = current_user.blogs
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new 
    @blog = Blog.new()
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blog_path @blog.id,:notice => "Blog was saved!!"
    else
      render "new"
    end

  end

  def edit
    @blog = Blog.find(params[:id])
    redirect_to blog_path, :notice => "Only creator can edit the blogs" if current_user && @blog.user_id != current_user.id
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path, :notice => "Blog edited"
    else
      render "edit"
    end
  end

  def destroy   
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, :notice => "Blog Deleted!!" 
  end

  def blog_params
    params.require(:blog).permit(:title, :description, :user_id, :blog_image)
  end

end
