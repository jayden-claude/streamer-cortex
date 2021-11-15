# frozen_string_literal: true

class VideosDataService
  BASE_VIDEO_URL = 'https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos'

  def self.call(page)
    new(page).fetch_videos_data
  end

  def initialize(page)
    @page = page
  end

  def fetch_videos_data
    url = "#{BASE_VIDEO_URL}?page=#{@page}"
    response = HTTParty.get(url)

    if response.success?
      JSON.parse(response.body)
    else
      handle_error(response)
    end
  rescue StandardError => e
    handle_error(e)
  end

  private

  def handle_error(error)
    Rails.logger.error("Failed to fetch videos data: #{error.message}")
    { 'videos' => [], 'meta' => { 'total' => 0 } }
  end
end
