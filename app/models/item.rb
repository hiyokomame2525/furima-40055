class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :preservation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time
  
  validates :image, :title, :content, presence: true

  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer:true}
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :preservation_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
end
