class CreateGenresSegments < ActiveRecord::Migration[5.1]
  def change
    create_table :genres_segments do |t|
      t.integer :segment_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
