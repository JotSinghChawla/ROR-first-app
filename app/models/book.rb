class Book < ApplicationRecord

    self.per_page = 5

    validates :fullname, :author, :publisher, :price, presence: true
    validates :fullname, length: { in: 3..30 }
    validates :fullname, uniqueness: true
    # validates :fullname, format: { with: /^[a-zA-Z_-]+$/, message: "only letters _ - are allowed"}         # security risk
    validates :fullname, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "can only contains: alphanumeric _ -"}
    validates :price, numericality: { greater_than_or_equal_to: 0}

    before_save :capitalize_fullname, :capitalize_author, :update_log_before_save
    # around_save :update_log_around_save                # around_save is not working, giving Book exists error
    after_save :update_log_after_save
    after_destroy :update_log_delete

    def capitalize_fullname
        self.fullname = self.fullname.capitalize
    end
    def capitalize_author 
        self.author = self.author.capitalize
    end
    def update_log_delete
        logger.info "======================Book #{self.fullname} with Id:#{self.id} is deleted======================"
    end
    def update_log_before_save
        logger.info "======================Book #{self.fullname} with Id:#{self.id} is going to be created======================"
    end
    def update_log_around_save
        logger.info "======================Book #{self.fullname} with Id:#{self.id} is being saved======================"
    end
    def update_log_after_save
        logger.info "======================Book #{self.fullname} with Id:#{self.id} is created======================"
    end
end
