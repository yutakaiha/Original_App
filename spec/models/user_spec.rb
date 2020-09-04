require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User バリデーションチェック" do
    let(:user){build(:user)}

    it "nickname,email,passwordがしっかり入力されていればUser作成可能" do
      expect(user).to  be_valid
    end

    context "nicknameのバリデーション" do
      
      it "nicknameが空欄の場合、User作成不可" do
        expect(build(:user, nickname: "")).to_not be_valid 
      end
    end
    
    context "emailのバリデーション" do
      let(:test_user){build(:user, email: "foofoo")}

      it "emailが空の場合、User作成不可" do
        expect(build(:user, email: "")).to_not be_valid 
      end
      
      it "emailが重複している場合" do
        user
        expect(test_user).to_not be_valid 
      end
    end

    context "passwordに関するバリデーション" do
    
      it "passwordが空欄の場合User登録できない" do
        expect(build(:user, password: "")).to_not be_valid 
      end

      # it "passwordが暗号化されているか" do
      #   user = create(:user)
      #   expect(user.password_digest).to_not eq "password"  
      # end

      it "password_confirmationとpasswrodが完全一致していない場合登録不可" do
        expect(build(:user, password_confirmation: "fugafuga")).to_not be_valid  
      end
    end
    
  end
end
