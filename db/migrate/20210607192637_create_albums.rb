class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.date :date
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
