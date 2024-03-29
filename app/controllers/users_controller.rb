class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update]
    before_filter :correct_user, only: [:edit, :update]
    before_filter :admin_user, only: [:destroy, :index, :new, :create]

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.paginate(page: params[:page])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to PieLab!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
    end
    
    def index
        @users = User.paginate(page: params[:page])
    end

    def update
        if @user.update_attributes(params[:user])
          sign_in @user
          flash[:success] = "Profile updated"
          redirect_to @user
        else
          render 'edit'
        end
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to users_url
    end

    private
        
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_path) unless current_user?(@user)
        end

        def admin_user
            redirect_to(root_path) unless admin?
        end
end
