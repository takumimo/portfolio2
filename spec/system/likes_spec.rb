require 'rails_helper'

RSpec.describe 'Likes', type: :system do
    describe 'いいね機能' do
        let(:user) { create(:user) }
        let!(:test_user) { create(:user) }
        let!(:user_post) { create(:post) }
        before do
            visit new_user_session_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: user.password
            click_button 'ログイン'
        end
        context 'index画面' do
            it 'いいね、いいね解除' do
                expect(page).to have_content '相談一覧'
                expect(current_path).to eq(posts_path)

                # いいねをするボタンを押す
                click_link '注目する'
                expect(page).to have_content '注目してます'

                # いいねを解除する
                click_link '注目してます'
                expect(page).to have_content '注目する'
                
            end
        end
        context 'show画面' do
            it 'いいね、いいね解除' do
                # いいねをするボタンを押す
                click_link '注目する'
                expect(page).to have_content '注目してます'

                # いいねを解除する
                click_link '注目してます'
                expect(page).to have_content '注目する'
            end
        end
    end
end
