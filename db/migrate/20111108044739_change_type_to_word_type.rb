class ChangeTypeToWordType < ActiveRecord::Migration
  def change 
    rename_column :Words, :type, :word_type
  end
end
