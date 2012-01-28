class RenameWordColumn < ActiveRecord::Migration
  def change 
    rename_column :words, :word, :word_text
  end
end
