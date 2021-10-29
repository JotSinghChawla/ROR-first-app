class AddIndexToBookAuthor < ActiveRecord::Migration[5.2]
  def change
    add_index :book , :author
  end
end
