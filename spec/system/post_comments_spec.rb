require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  describe 'show画面でコメントする' do
    let(:user) { create(:user) }
    let!(:test_user2) { create(:user) }
    let!(:post) { create(:post) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      # 一番上の投稿をクリック
      click_button ''
    end
  end
end
