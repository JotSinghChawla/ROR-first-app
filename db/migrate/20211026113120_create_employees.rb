class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :age
      t.string :doj
      t.string :designation
      t.integer :salary

      t.timestamps
    end
  end
end
