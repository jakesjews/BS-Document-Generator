class AddWordUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :words, :word, :unique => true
  end

  def down
    remove_index :words, :word
  end
end
