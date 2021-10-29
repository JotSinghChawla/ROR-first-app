class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :author
      t.integer :isbn
      t.string :publisher
      t.float :price
      t.integer :pages
      t.integer :copies

      t.timestamps
    end
  end
end
