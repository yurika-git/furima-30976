require 'rails_helper'


RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
  
    end
  
    describe '商品出品機能' do
      context '商品出品できるとき' do
        it '必要な情報を適切に入力すると登録できる' do
          expect(@item).to be_valid
        end
        it '販売価格は半角数字かつ300から9999999の範囲であれば登録できる' do
          @item.price = '400'
          expect(@item).to be_valid
        end
      end
      context '商品出品できないとき' do
        it '商品画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.product = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product can't be blank")
        end
        it '商品説明が空では登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリー情報がなければ登録できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品状態の情報がなければ登録できない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it '配送料負担情報がなければ登録できない' do
          @item.charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge can't be blank")
        end
        it '配送元地域情報がなければ登録できない' do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it '発送までの日数情報がなければ登録できない' do
          @item.shipping_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping can't be blank")
        end
        it '価格が空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '価格の範囲が¥300~¥9,999,999の間でないと登録できない' do
          @item.price = 111
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '販売価格は半角数字でないと登録できない' do
          @item.price = '３３３'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'カテゴリーの値が1であれば保存しない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it '商品状態の値が1であれば保存しない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it '配送負担項目の値が1であれば保存しない' do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge must be other than 1")
        end
        it '発送元地域の値が1であれば保存しない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Area must be other than 1")
        end
        it '発送日数の値が1であれば保存しない' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping must be other than 1")
        end
      end
    end
end
