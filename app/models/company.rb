class Company < ApplicationRecord
    has_many :employees, dependent: :destroy    #destroy all employees when company is destroyed
end
