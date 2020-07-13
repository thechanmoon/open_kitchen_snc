class PostsController < ApplicationController
    before_action :require_logged_in
    before_action :admin_user , except: [:index, :show]
    def index
        @user = current_user
        @posts = Post.all
    end

    def new
        @post = Post.new
        @restaurant = Restaurant.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
    end
  
    def create
        @restaurant = Restaurant.find(params[:id])
        @post = Post.new(title: params[:post][:title], message: params[:post][:message], restaurant_id: @restaurant.id)
        @post.save
        redirect_to post_path(@post)
    end


    # private
    # def post_params
    #     params.require(:post).permit(:title, :message, :restaurant_id, :id)
    # end
end
