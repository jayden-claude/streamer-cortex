# frozen_string_literal: true

module Playlists
  class VideosController < ApplicationController
    before_action :set_playlist
    before_action :set_video, only: :destroy

    def create
      @video = @playlist.videos.new(video_params)
      if @video.save
        redirect_to @playlist, notice: 'Video added to playlist successfully'
      else
        redirect_to @playlist, alert: @video.errors.full_messages.to_sentence
      end
    end

    def destroy
      if @video.destroy
        redirect_to @playlist, notice: 'Video removed from playlist successfully'
      else
        redirect_to @playlist, alert: 'Error removing video from playlist'
      end
    end

    private

    def set_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    def set_video
      @video = @playlist.videos.find(params[:id])
    end

    def video_params
      params
        .require(:video)
        .permit(
          :video_id,
          :title,
          :description,
          :thumbnail_url,
          :views
        )
    end
  end
end
