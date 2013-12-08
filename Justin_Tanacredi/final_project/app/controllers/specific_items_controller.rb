class SpecificItemsController < ApplicationController
  before_action :is_admin?, only: [:edit, :show, :update, :create, :destroy]

  def is_admin?

  end
end
