require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe "ユーザー新規登録" do
   context '新規登録できるとき' do
    it '全ての項目の入力が存在すれば登録できること' do
     expect(@user).to be_valid
    end
   end

   context '新規登録できないとき' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameが入力されていません。")
    end
    it 'emailが空では登録できないこと' do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
    end
    it 'passwordが空では登録できないこと' do
     @user.password = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("パスワードが入力されていません。", "パスワードが入力されていません。", "パスワードは有効でありません。", "確認用パスワードが内容とあっていません。")
    end
    it 'last_nameが空では登録できないこと' do
     @user.last_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last nameが入力されていません。", "Last nameは有効でありません。")
    end
    it 'given_namesが空では登録できないこと' do
     @user.given_names = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Given namesが入力されていません。", "Given namesが入力されていません。", "Given namesは有効でありません。")
    end
    it 'last_name_furiganaが空では登録できないこと' do
     @user.last_name_furigana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name furiganaが入力されていません。", "Last name furiganaが入力されていません。", "Last name furiganaは有効でありません。")
    end
    it 'given_names_furiganaが空では登録できないこと' do
     @user.given_names_furigana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Given names furiganaが入力されていません。", "Given names furiganaが入力されていません。", "Given names furiganaは有効でありません。")
    end
    it 'birthdayが空では登録できないこと' do
     @user.birthday = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Birthdayが入力されていません。")
    end

    it '重複したemailが存在する場合登録できないこと' do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
     expect(another_user.errors.full_messages).to include("メールアドレスは既に使用されています。")
    end
    it 'emailに@が含まれていなければ登録できないこと' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは有効でありません。")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
     @user.password = '12345'
     @user.password_confirmation = '12345'
     @user.valid?
     expect(@user.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。", "パスワードは有効でありません。")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
     @user.password = '123456'
     @user.password_confirmation = '1234567'
     @user.valid?
     expect(@user.errors.full_messages).to include("確認用パスワードが内容とあっていません。", "パスワードは有効でありません。")
    end

    it 'passwordが半角英字だけでは登録ができないこと' do
      @user.password = 'iiiiii'
      @user.password_confirmation = 'iiiiii'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは有効でありません。")
     end
     it 'passwordが半角数字だけでは登録ができないこと' do
      @user.password = '999999'
      @user.password_confirmation = '999999'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは有効でありません。")
     end

    it 'last_nameが全角入力でなければ登録できないこと' do
     @user.last_name = 'ｱｲｳｴｵ'
     @user.valid?
     expect(@user.errors.full_messages).to include("Last nameは有効でありません。")
    end
    it 'given_namesが全角入力でなければ登録できないこと' do
     @user.given_names = 'ｱｲｳｴｵ'
     @user.valid?
     expect(@user.errors.full_messages).to include("Given namesは有効でありません。")
    end
    it 'last_name_furiganaが全角カタカナでなければ登録できないこと' do
     @user.last_name_furigana = 'あいうえお'
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name furiganaは有効でありません。")
    end
    it 'given_name_furiganaが全角カタカナでなければ登録できないこと' do
     @user.given_names_furigana = 'あいうえお'
     @user.valid?
     expect(@user.errors.full_messages).to include("Given names furiganaは有効でありません。")
    end

   end
 end
end
# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
