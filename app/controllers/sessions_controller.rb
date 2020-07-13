class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    user = user.try(:authenticate, params[:user][:password])

    if user
      session[:user_id] = user.id
      @user = user
      if @user.is_owner
        redirect_to controller: 'welcome', action: 'admin'
      else
        redirect_to controller: 'posts', action: 'index'
      end  
    else
      flash[:message] = 'User does not exists'
      redirect_to controller: 'sessions', action: 'new'
    end  
    # return redirect_to(controller: 'sessions', action: 'new') unless user

    # session[:user_id] = user.id

    # @user = user

    # redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
end