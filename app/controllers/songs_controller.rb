class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    @song = Song.create(song_params(:title, :released, :release_year, :artist_name, :genre))
    redirect_to song_path(@song)
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song = Song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
    redirect_to song_path(@song)
  end

  def  destroy
    @song = Song.destroy(params[:id])
    redirect_to songs_path
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
