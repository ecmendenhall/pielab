class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :create, :new, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def create
      @post = current_user.posts.build(params[:post])
      if @post.save
          flash[:success] = "Post created!"
          redirect_to post_path(@post)
      else
          render 'new'
      end
  end

  def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "Post deleted."
      redirect_back_or current_user 
  end

  def update
      if @post.update_attributes(params[:post])
          flash[:success] = "Post updated"
          redirect_to @post
        else
          render 'edit'
        end
  end

  def new
      store_location
      @user = current_user
      @post = current_user.posts.new
      @image = @post.images.new
  end

  def edit
      store_location
      @post = Post.find(params[:id])
      @image = @post.images.new
  end

  def show
      @post = Post.find(params[:id])
  end

  def index
      store_location
      @posts = Post.paginate(page: params[:page])
  end

  private
        
    def correct_user
        @post = Post.find(params[:id])
        @user = @post.user
        redirect_to(root_path) unless current_user?(@user) || current_user.admin? 
    end

    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end

end
