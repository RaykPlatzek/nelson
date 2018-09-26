require 'rails_helper'

RSpec.describe "Orders", :vcr do

  let(:user) {User.create(email: "test_user@me.com", password: "test123", password_confirmation: "test123")}
  let(:pair) {Pair.create(code: AUDEUR, trend: TREND_NO_CHANGE)}
  let(:cash_account) {Account.create(pair_id: pair.id, account_type: CASH_ACCOUNT, user_id: user.id, balance: 1000)}
  let(:trading_account) {Account.create(pair_id: pair.id, account_type: TRADING_ACCOUNT, user_id: user.id)}

  def create_order(order_type, value = 100)
    Order.create!(user_id: user.id, account_id: trading_account.id, pair_id: pair.id, value: value, trading_price: 1, order_type: order_type)
  end
  
  describe "create" do
    it "creates new order" do
      create_order(ORDER_TYPE_BUY)
      expect(Order.count).to eq 1
    end

    it "updates cash account after creation" do
      expect(cash_account.balance).to eq 1000
      create_order(ORDER_TYPE_BUY).save
      expect(cash_account.reload.balance).to eq 900
    end
  end

  describe "valid" do
    it "returns false if buy and not enough cash" do
      expect(cash_account.balance).to eq 1000
      new_order = create_order(ORDER_TYPE_BUY, 2000)
      expect(new_order.valid).to eq false
    end

    it "return false if sell and not enough units" do
      expect(trading_account.current_account_valuation).to eq 0
      new_order = create_order(ORDER_TYPE_SELL, 2000)
      expect(new_order.valid).to eq false
    end

    it "returns true if enough cash" do
      expect(cash_account.balance).to eq 1000
      new_order = create_order(ORDER_TYPE_BUY, 200)
      expect(new_order.valid).to eq true
    end
  end
end