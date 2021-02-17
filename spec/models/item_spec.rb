require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "出品物の情報登録" do
    context "出品物の情報登録ができない時" do
      it "全ての値が正しく入力されていれば登録可能" do
      expect(@item).to be_valid
  end
end
context "出品物の情報登録が上手くできない時" do
  it "imageが空では登録できない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it "nameが空だと登録できない" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "descriptionが空だと登録できない" do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it "preparation_day_idが未選択だと登録できない" do
    @item.preparation_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
  end
  it "item_condition_idが未選択だと登録できない" do
    @item.item_condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Item condition must be other than 1")
  end
  it "category_idが未選択だと登録できない" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end
  it "shipping_fee_idが未選択だと登録できない" do
    @item.shipping_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
  end
  it "prefecture_idが未選択だと登録できない" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "priceが空だと登録できない" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "priceが全角だと登録できない" do
    @item.price = "４７８５"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it "priceが半角英数混合では出品できない" do
  @item.price = "a1"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it "priceが半角英字のみでは出品できない" do
  @item.price = "a"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
  end
  it "priceが299円以下では出品できない" do
  @item.price = 298
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be greater than 299")
  end
  it "priceが10_000_000円以上では出品できない" do
  @item.price = 10000001
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be less than 10000000")
  end
 end
end
pending "add some examples to (or delete) #{__FILE__}"
end
