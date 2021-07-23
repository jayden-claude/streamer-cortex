# frozen_string_literal: true

class PlaylistsController < ApplicationController
  before_action :set_playlist, only: :show

  def show
    @videos = @playlist.videos
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)

    if @playlist.save
      redirect_to videos_path, notice: 'Playlist created successfully'
    else
      redirect_to videos_path, alert: 'Failed to create playlist'
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end
