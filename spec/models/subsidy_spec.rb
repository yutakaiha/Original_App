require 'rails_helper'

RSpec.describe Subsidy, type: :model do

  let(:category){ Category.create(
          title: "hogehoge",
          picture: "test.png"
        )}

  # let(:subsidy){create(:subsidy, category: category)}

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
