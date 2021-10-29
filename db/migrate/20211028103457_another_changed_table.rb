class AnotherChangedTable < ActiveRecord::Migration[5.2]
  def change
    
    
    add_index :books, :name


    remove_column :books, :demo, :string
    add_timestamps :books, null: true

  end
end
