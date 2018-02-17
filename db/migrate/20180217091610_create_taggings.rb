class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :note_id

      t.timestamps null: false
    end
    add_index :taggings, :tag_id
    add_index :taggings, [:tag_id, :note_id], unique: true
  end
end
