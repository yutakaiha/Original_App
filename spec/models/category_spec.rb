require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "categoryモデルの検証" do
    let(:category){create(:category)}
    
    context "バリデーションの検証" do
      let(:category){build(:category, title: "")}
      it "titleが空白の場合falseとなる" do
        expect(category).to_not  be_valid
      end
    end
    
    # context "アソシエーションの検証" do
    #   pending "テストがなぜか間違いevent_id{1}が怪しいが現時点で原因不明のため保留" 
      
    #   let(:subsidy){create(:subsidy, category_id: category.id)}
      
    #   it "categoryのレコードを削除するとsubsidyのレコードも削除される" do
    #     expect{category.id}.to eq subsidy.category_id
    #   end
    # end
    
  end
  
end
