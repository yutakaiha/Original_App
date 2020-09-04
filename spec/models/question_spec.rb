require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Questionモデルのテストを実装" do
    let(:question){build(:question)}

    it "category,title,content,category_id,user_idがある場合は登録可能" do
      expect(question).to be_valid  
    end

    it "user_idがない場合はは登録不可" do
      expect(build(:question, user_id: nil)).to_not be_valid
    end

    context "titleに関するバリデーション" do
      it "タイトルが空欄の場合投稿できない" do
        expect(build(:question, title: "")).to_not be_valid 
      end
    end
    
    context "categoryに関するバリデーション" do
      it "カテゴリが未選択の場合投稿できない" do
        expect(build(:question, category_id: nil)).to_not be_valid
      end
    end

    context "contentに関するバリデーション" do
      it "contentが未入力の場合投稿できない" do
        expect(build(:question, content: "")).to_not be_valid 
      end
    end
    
  end
  
end
