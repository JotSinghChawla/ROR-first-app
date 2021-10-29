class ChangedTable < ActiveRecord::Migration[5.2]
  def change
    add_column :books,:publisher,:string
    add_column :books,:demo,:string
    rename_column :books, :name, :fullname
    remove_timestamps :books
  end
end
