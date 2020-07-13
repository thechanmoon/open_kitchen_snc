class UsersController < ApplicationController
    before_action :require_logged_in, except: [:new, :create, :edit, :update]
    before_action :admin_user , except: [:new, :create, :show]
    def index
      # if admin_user
        @users = User.all
      # end
    end

    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user
        session[:user_id] = @user.id
        if @user.is_owner
          redirect_to controller: 'welcome', action: 'admin' 
        else
          redirect_to controller: 'posts', action: 'index' 
        end   
      else
        flash[:message] = "Can't create user #{user_params[:first_name]}"
        redirect_to controller: 'users', action: 'new' 
        # redirect_to new_user_path 
      end
      # return redirect_to controller: 'users', action: 'new' unless @user.save
      # session[:user_id] = @user.id
      # redirect_to controller: 'welcome', action: 'home'  
    end
  
    def show
      # if admin_user
        @user = User.find(params[:id])
      # end
    end

    def edit
      # byebug
      # if admin_user
      @user = User.find(params[:id])  
      # end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.save
          redirect_to @user
        else
          render :edit
        end
    end
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :imageurl, :is_owner)
    end
end