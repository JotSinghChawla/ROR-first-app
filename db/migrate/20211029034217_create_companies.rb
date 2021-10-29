class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :starting_year
      t.string :location
      t.string :country

      t.timestamps
    end
  end
end
