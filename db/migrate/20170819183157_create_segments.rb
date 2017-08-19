class CreateSegments < ActiveRecord::Migration[5.1]
  def change
    create_table :segments do |t|
      t.string :name, null:false
      t.text :body, null:false
      t.string :latitude
      t.string :longitude
      t.integer :author_id

      t.timestamps
    end
  end
end
