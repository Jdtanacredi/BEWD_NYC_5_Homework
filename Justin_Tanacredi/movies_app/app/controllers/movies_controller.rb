class MoviesController < ApplicationController
  before_action :find_movie, only: [:edit, :update, :show]
  def index
    @movies = Movie.order(:title)
  end

  def new
    @movie = Movie.new
  end

  def create
    ## This adds security!!!!!
    @movie = Movie.create safe_movie

    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
    #redirect_to movie

  end

  def show
  end

  def edit
  end

  def update
    @movie.update safe_movie
    redirect_to @movie
  end

  private

  def find_movie
    @movie = Movie.find params[:id]
  end

  def safe_movie
    params.require(:movie).permit(:title, :description)
  end
end
