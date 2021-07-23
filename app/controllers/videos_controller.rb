# frozen_string_literal: true

class VideosController < ApplicationController
  ITEMS_PER_PAGE = 20.0

  before_action :set_videos_data

  def index
    @total_pages = 1
    return @videos = search_title(params[:search]) if params[:search].present?

    @videos, @total_pages = fetch_videos_and_page
  end

  private

  def fetch_videos_and_page
    videos = @videos_data['videos']
    total_items = @videos_data['meta']['total']
    total_pages = (total_items / ITEMS_PER_PAGE).ceil

    [videos, total_pages]
  end

  def search_title(title)
    matched_videos = @videos_data['videos'].select { |video| video['title'].downcase.include?(title.downcase) }
    matched_videos.concat(Video.all.select do |video|
                            video.title.downcase.include?(title.downcase)
                          end).uniq { |entry| entry['id'] != entry['video_id'] }
  end

  def set_videos_data
    @page = params[:page].to_i.positive? ? params[:page].to_i : 1
    @videos_data = VideosDataService.call(@page)
  end
end
