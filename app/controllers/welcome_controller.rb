class WelcomeController < ApplicationController
  before_action :require_logged_in

  def home
  end

  def error
  end

  def admin
  end
end