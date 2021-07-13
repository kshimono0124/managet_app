require 'rails_helper'

RSpec.feature "Clients", type: :feature do
  before do
    FactoryBot.create(:client)
  end
  
  it 'Check if the company information is displayed.' do
    # 会社一覧を開く
    visit clients_path
    # 会社名が正しく表示されていること
    expect(page).to have_content 'test株式会社'
    # 名前が正しく表示されていること
    expect(page).to have_content 'test部長'
    # 電話番号が正しく表示されていること
    expect(page).to have_content '000-9999-0000'
    # Eメールが正しく表示されていること
    expect(page).to have_content 'test-butyo@example.com'
  end
end
