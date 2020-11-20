require 'rails_helper'

RSpec.describe 'Likes', type: :system do
    describe 'いいね機能' do
        let(:user) { create(:user) }
        let!(:test_user2) { create(:user) }
        let!(:post) { create(:post, user: user) }
        before do
            visit new_user_session_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: user.password
            click_button 'ログイン'
        end
        it 'いいね、いいね解除' do
            expect(page).to have_content '相談一覧'
            expect(current_path).to eq(posts_path)

            # いいねをするボタンを押す
            find('#likes_buttons').click
            expect(page).to have_selector 'a[data-method=post]', text: 'post'
            expect(post.likes.count).to eq(1)

            # いいねを解除する
            find('#likes_buttons').click
            expect(page).to have_selector 'a[data-method=delete]', text: 'delete'
            expect(post.likes.count).to eq(0)
        end
    end
end
