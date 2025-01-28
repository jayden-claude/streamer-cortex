# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :playlist, null: false, foreign_key: true
      t.string :video_id
      t.string :title
      t.text :description
      t.string :thumbnail_url
      t.integer :views

      t.timestamps
    end
  end
end
