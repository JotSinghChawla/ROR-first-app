class AddCompanyToEmployees < ActiveRecord::Migration[5.2]
  def change
    # rails g migration AddCompanyToEmployees company:references          # command used to generate migration
    add_reference :employees, :company, foreign_key: true
  end
end
