class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :user, index: true, foreign_key: true
      t.references :sharer, index: true
      t.references :note, index: true, foreign_key: true
      t.integer :permissions, default:0
      t.references :shareable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :shares, :users, column: :sharer_id, primary_key: :id
  end
end
