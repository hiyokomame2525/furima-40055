class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :street_address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :street_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Please enter 10or11 digit half-width numbers."}
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address,  telephone_number: telephone_number, building_name: building_name, purchase_history_id: purchase_history.id)
  end
end