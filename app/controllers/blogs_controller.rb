class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy, :edit, :update]
  def new
    @blog = Blog.new
  end

  def index
    @blogs = Blog.all
  end

  def show
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def edit
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    @blog.id = params[:id]
    render :index if @blog.invalid?
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
 
  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
end