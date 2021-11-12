# frozen_string_literal: true

# == Schema Information
#
# Table name: videos
#
#  id            :integer          not null, primary key
#  playlist_id   :integer          not null
#  video_id      :string
#  title         :string
#  description   :text
#  thumbnail_url :string
#  views         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Video < ApplicationRecord
  belongs_to :playlist

  validates :video_id, uniqueness: { scope: :playlist_id, message: 'already exists in playlist' }
end
