# frozen_string_literal: true

# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Playlist < ApplicationRecord
  has_many :videos, dependent: :destroy
end
