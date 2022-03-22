class Product < ApplicationRecord
    validates :title, presence: true
    validates :cost, presence: true
    validates :image, presence: true
    validates :stock, presence: true
    validates :description, presence: true, length: { minimum: 10 }

    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }
  
    def archived?
      status == 'archived'
    end
end
