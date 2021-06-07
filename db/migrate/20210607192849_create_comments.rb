class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.date :date
      t.text :text
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
