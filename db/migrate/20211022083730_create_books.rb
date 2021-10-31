class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.float :price
      # publisher(string) is also added later

      t.timestamps
    end
  end
end
