require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before do
    # ユーザを作成する
    User.create!(name: 'guest', email: 'guest@guest.com', password: 'foobar', password_confirmation: 'foobar')
  end
  it 'Log in' do
    # トップページを開く
    visit new_user_session_path
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'Eメール', with: 'guest@guest.com'
    fill_in 'パスワード', with: 'foobar'
    # ログインボタンをクリックする
    click_button('Log in')
    # ログインに成功したことを検証する
    expect(page).to have_content 'ログインしました'
  end
end
