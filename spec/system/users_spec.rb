require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合，サインアップページに移動する' do
    #トップページに遷移する
    visit root_path
    #ログインしていない場合，サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し，ルートパスに遷移する' do
    #予め，ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #サインインページに遷移する
    visit new_user_session_path
    #ログインしていない場合，サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #すでに保存されているユーザーのemaiとpasswordを入力する
    fill_in 'Email', with: @user.email         #'Password'は'user_email'でも可
    fill_in 'Password', with: @user.password   #'Password'は'user_password'でも可
    #ログインボタンをクリックする
    find('input[name="commit"]').click  #click_on("Log in")でも可
    #ルートページに遷移することを期待する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し，再びサインインページに戻ってくる' do
    #予め，ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #トップページに遷移する
    visit root_path
    #ログインしていない場合，サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #誤った情報を入力する
    fill_in 'Email', with: "sagajsom"         #'Password'は'user_email'でも可
    fill_in 'Password', with: "eniz@lq.com"   #'Password'は'user_password'でも可
    #ログインボタンをクリックする
    click_on("Log in")
    #サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end
end
