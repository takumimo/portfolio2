require 'rails_helper'

RSpec.describe 'ストックする', type: :system do
  describe 'ストック機能' do
    let(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:post2) { create(:post, user: user2) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    it 'ストックする' do
      visit post_path(post2)
      click_button 'ストックする'
      expect(page).to have_content('ストック中')
    end
    it 'ストックを外す' do
      visit post_path(post2)
      click_button 'ストックする'
      click_button 'ストック中'
      expect(page).to have_content('ストックする')
    end
  end
end
