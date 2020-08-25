require 'rails_helper'

#expect{X}.to change{Y}.from(a).to(b) 
#上記は「Xの処理を実行するとY（値）がaからbへ変わることを期待する」と解釈

#expect{X}.to change{Y}.by(-1)
#by を使うと「（元の個数はともかく）1個減ること」を検証

RSpec.describe Subsidy, type: :model do

  let(:category){ Category.create(
          title: "hogehoge",
          picture: "test.png"
        )}
    
    let(:subsidy){ category.subsidies.create(
          title: "foo",
          content: "foofoo",
          start_date: Time.current,
          end_date: "",
          limit_amount: 3,
          event_id: 1
        )}

  describe "バリデーションの検証" do
    subject { subsidy.valid? }
    shared_examples "バリデーションの結果" do
      it {is_expected.to eq false}
    end
    context "titleの場合" do
      let(:title) {""}
      it_behaves_like "バリデーションの結果"
    end
    context "contentの場合" do
      let(:content){""}
      it_behaves_like "バリデーションの結果"
    end
    context "start_atの場合" do
      let(:start_at){""}
      it_behaves_like "バリデーションの結果"
    end
  end

  describe "アソシエーションの検証" do
    it "助成金がカテゴリと関連付けされているか検証" do
      expect(subsidy.category_id).to  eq category.id
    end
  end
  
end
