require 'rails_helper'

RSpec.feature "Publics（ログイン不要ページの遷移テスト）", type: :feature do
  # given(:user){create(:user)}
  context
  scenario "ログインしていない時のtopページのリンクの確認" do
    visit root_path
    expect(page).to have_link "新規登録はこちら" 
    expect(page).to have_link "助成金等検索" 
    expect(page).to have_link "ライフイベントから検索"  
    expect(page).to have_link "妊娠・出産" 
    expect(page).to have_link "子育て・保育"
    expect(page).to have_link "学校教育"
    expect(page).to have_link "結婚・離婚"
    expect(page).to have_link "引越し・暮らし"
    expect(page).to have_link "就職・退職"
    expect(page).to have_link "高齢者・介護"
    expect(page).to have_link "おくやみ" 
    expect(page).to have_link "カテゴリ別検索" 
    expect(page).to have_link "ログイン" 
    expect(page).to_not have_link "ログアウト" 
    expect(page).to_not have_link "アカウント編集" 
  
  end
end
