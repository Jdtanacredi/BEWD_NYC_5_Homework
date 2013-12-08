class AdminsController < ApplicationController
  before_action :is_admin?, only: [:edit, :show, :update, :create, :destroy]

  def is_admin?
    current_user = session[:user_id]
    unless current_user.admin?
      redirect_to 'root'
   end
  end
end