class PurchaseDelivery
  include ActiveModel::Model

  attr_accessor :number, :cvc, :exp_month, :exp_year, :token, :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postcode,        format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
                                # , message: "is invalid. Include hyphen(-)"  ←←もしエラーメッセージを表示させる場合の例
    validates :prefecture_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number,    format: {with: /\A[0-9]{10,11}\z/}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end