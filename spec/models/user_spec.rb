require 'rails_helper'


RSpec.describe User, type: :model do

  

    before do
      @user = FactoryBot.build(:user)
    end
      describe "ユーザー新規登録" do
      context "ユーザが新規登録できるとき" do
      end
     it  "全ての項目の入力ができれば登録できること" do
       expect(@user).to be_valid
     end 
     it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid 
    end
  end

      context "新規登録できないとき" do
    it "nicknameは空だと登録できない" do
      
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    

    it "passwordが空の時は登録できない" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    

    

    it "family_nameが空の時は登録できない" do
    @user.family_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "family_name_kanaが空の時は登録できない" do
    @user.family_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "first_nameが空の時は登録できない" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_name_kanaが空の時は登録できない" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "birth_dateが空の時は登録できない" do
    @user.birth_date = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it "passwordが5文字以下は登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空なら登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #email 一意制約のテスト

    it "重複したemailが存在する場合は登録できない" do
         @user.save
         another_user = FactoryBot.build(:user, email: @user.email)
         another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    #emailに＠をつける
    it "@を付けないと登録できない" do
    @user.email = "testtest77"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
    end
       #パスワードに英数字が含まれるテスト

       it "password:パスワード半角英数混合(半角英語のみ)" do
       @user.password = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
       it "password:パスワード半角英数混合(半角数字のみ)" do
       @user.password = '111111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end





      #名前全角入力
    it "family_nameは全角入力しか登録できない" do
      @user.family_name = "ｱｲｳｴｵ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "first_nameは全角入力しか登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "family_name_kanaは全角カタカナ入力しか登録できない" do
      @user.family_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "first_name_kanaは全角カタカナ入力しか登録できない" do
      @user.first_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end

