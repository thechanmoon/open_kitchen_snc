
class LikesController < ApplicationController
    before_action :require_logged_in,

    def create
        @post = Post.find(params[:post_id])
        @like = Like.new(user_id: session[:user_id], post_id: @post.id)
        @like.save
        redirect_to posts_path
      end

      def destroy
        # byebug
        @like = Like.find_by(post_id: params[:post_id],user_id: current_user.id)
        @like.destroy
        redirect_to posts_path
      end
    
    end