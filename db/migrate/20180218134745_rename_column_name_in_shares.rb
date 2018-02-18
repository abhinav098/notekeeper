class RenameColumnNameInShares < ActiveRecord::Migration
  def change
    rename_column :shares, :permissions, :permission
  end
end
