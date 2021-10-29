class AddCompanyReferenceInEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :employees, foreign_key: true
  end
end
