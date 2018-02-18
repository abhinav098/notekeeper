class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :shareable, polymorphic: true, index: true
      t.integer :permission, default:0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
