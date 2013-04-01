class ImagesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :index]
  before_filter :admin_user, only: [:destroy]

  def create
      @image = Image.new(params[:image])
      if @image.save
          flash[:success] = "Image saved."
          store_image_url(@image.image_file.url)
          redirect_back_or root_path 
      else
          flash[:error] = "Image could not be uploaded."
          redirect_back_or root_path
      end
  end

  def destroy
      Image.find(params[:id]).destroy
      flash[:success] = "Image deleted."
      redirect_back_or images_path
  end

  def new
      store_location
      @image = Image.new
  end

  def index
      store_location
      @images = Image.paginate(page: params[:page])
  end

  private
        
    def admin_user
        redirect_to(root_path) unless admin?
    end

    def store_image_url(url)
        session[:image_url] = url
    end

end
