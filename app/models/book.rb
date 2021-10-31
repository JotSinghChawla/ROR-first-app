class Book < ApplicationRecord
    validates :fullname, presence: true
    validates :fullname, length: { in: 3..30 }
    validates :fullname, uniqueness: true
    # validates :fullname, format: { with: /^[a-zA-Z_-]+$/, message: "only letters _ - are allowed"}         # security risk
    validates :fullname, format: { with: /\A[a-zA-Z_-]+\z/, message: "can only contains: letters _ -"}
    validates :author, presence: true
    validates :publisher, presence: true
    validates :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0}
end
