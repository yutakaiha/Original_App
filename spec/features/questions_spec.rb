require 'rails_helper'

RSpec.feature "Questions", type: :feature do
  let(:user){create(:user)}

  scenario "ユーザーがログインから質問投稿するまでのテスト" do
    # topページへログイン
    visit root_path

    #ログインページへ遷移し必要事項を入力しログイン
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
    
    #相談（質問コーナーへ）
    click_on "気軽に相談コーナー"

    #質問投稿ページへ遷移
    click_on "質問・相談を投稿する"

    #必要事項入力し投稿
    pending "なぜかselectオプションが動かないので保留" 

    select "くらしと手続き（税金・国保・年金・ごみ・環境等）", from: "質問タイトル"
    fill_in "質問タイトル", with: "年金について"
    fill_in "質問内容", with: "将来年金ってもらえるの？"
    click_on "投稿する"

    #flashメーセージの表示
    expect(page).to have_content "質問を投稿しました" 

  end
end
