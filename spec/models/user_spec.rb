require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User バリデーションチェック" do
    context "nicknameのバリデーション" do
      let(:user){build(:user, nickname: "")}
      it "nicknameが空欄の場合、User作成不可" do
        expect(user.valid?).to eq false  
      end
    end
    
    context "emailのバリデーション" do
      let(:user1){build(:user, email: "")}
      let(:user2){create(:user)}
      let(:test_user){build(:user, email: "foofoo")}

      it "emailが空の場合、User作成不可" do
        expect(user1.valid?).to eq false  
      end
      
      it "emailが重複している場合" do
        user2
        expect(test_user.valid?).to eq false 
      end
    end
    
  end
end
