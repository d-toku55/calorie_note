require 'rails_helper'

RSpec.describe UserRecodr, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user_recodr = FactoryBot.build(:user_recodr)
  end

  describe '食品データのメモ' do
    context '食品データがメモできるとき' do
      it '全ての値が正しく入力されていればメモできること' do
        expect(@user).to be_valid
      end
      it 'gは空でもメモできること' do
        @user_recodr.g = nil
        expect(@user).to be_valid
      end
    end

    context '食品データがメモできないとき' do
      it '日付が空では登メモできないこと' do
        @user_recodr.date = nil
        @user_recodr.valid?
        expect(@user_recodr.errors.full_messages).to include('日付を入力してください')
      end
      it '食品名が空ではメモできないこと' do
        @user_recodr.food_name = nil
        @user_recodr.valid?
        expect(@user_recodr.errors.full_messages).to include('食品名を入力してください')
      end
      it 'カロリーが空ではメモできないこと' do
        @user_recodr.kcal = nil
        @user_recodr.valid?
        expect(@user_recodr.errors.full_messages).to include('カロリーを入力してください')
      end
      it 'カロリーの値が数字以外ではメモできないこと' do
        @user_recodr.kcal = 'abcd'
        @user_recodr.valid?
        expect(@user_recodr.errors.full_messages).to include('数字以外は不正な値です')
      end
      it 'グラムの値が数字以外ではメモできないこと' do
        @user_recodr.g = 'abcd'
        @user_recodr.valid?
        expect(@user_recodr.errors.full_messages).to include('数字を入力してください')
      end
    end
  end
end