require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "answerモデルに関するテスト" do

    it "content,user_id,question_id(外部キー)があれば登録可能" do
      expect(build(:answer)).to be_valid  
    end
    
    context "contentに関するテスト" do
      it "contentが空白であれば投稿不可" do
        expect(build(:answer, content: "")).to_not be_valid  
      end
    end

    it "user_id（外部キー）がなければ登録できない" do
      expect(build(:answer, user_id: nil)).to_not be_valid  
    end

    it "question_idがなければ投稿できない" do
      expect(build(:answer, question_id: nil)).to_not be_valid  
    end
    
  end
  
end
