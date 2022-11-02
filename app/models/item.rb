class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :delivery_day
  has_one :purchase
  
  validates :image,                     presence: true
  validates :name,                      presence: true
  validates :description,               presence: true
  validates :category_id,               numericality: { other_than: 1 , message: "を選択してください"}
  validates :state_id,                  numericality: { other_than: 1 , message: "を選択してください"}
  validates :delivery_charge_burden_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :prefecture_id,             numericality: { other_than: 1 , message: "を選択してください"}
  validates :delivery_day_id,           numericality: { other_than: 1 , message: "を選択してください"}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  # 以下2行記述は自身の参考情報としてのメモ
    # ーーーーーーーーーーーーーーーーーーーーーーーーーーー
    # validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    # validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    # ーーーーーーーーーーーーーーーーーーーーーーーーーーー

end
