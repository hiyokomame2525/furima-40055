class PurchaseHistory < ApplicationRecord
  belongs_to :user,dependent: :destroy
  belongs_to :item,dependent: :destroy
  has_one :address,dependent: :destroy
  
  attr_accessor :token
end
