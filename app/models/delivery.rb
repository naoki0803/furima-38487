class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to :prefecture

  # 以下は実装に問題ないことを確認してから削除する(自分んで)記述したコメント
  # validates :postcode,                  null: false
  # validates :prefecture_id,             null: false
  # validates :city,                      null: false
  # validates :block,                     null: false
  # validates :building
  # validates :phone_number,              null: false
  # validates :purchase,                  null: false, foreign_key: true
end
