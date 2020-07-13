class RestaurantsController < ApplicationController
    before_action :require_logged_in
    # before_action :admin_user
    before_action :admin_user , except: [:index, :show]
    def index
        @restaurants = Restaurant.all
    end

    def show 
        @restaurant = Restaurant.find(params[:id])  
    end

    def new
        @restaurant = Restaurant.new
    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to @restaurant, notice: "Restaurant added successfully"
        else
            render "new"
        end
    end

    def edit
        # byebug
        @restaurant = Restaurant.find(params[:id])  
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.update(restaurant_params)
        if @restaurant.save
          redirect_to @restaurant
        else
          render :edit
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        flash[:notice] = "Restaurant deleted."
        redirect_to restaurants_path
    end

    def restaurant_params
        params.require(:restaurant).permit(
            :name, :description, :website, :phonenumber, :imageurl, :email
        )
    end
end