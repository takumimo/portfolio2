require 'rails_helper'

RSpec.describe 'Likes', type: :system do
    describe '#create,#destroy' do
        it 'いいね、いいね解除' do

            visit new_user_session_path
            fill_in 'メールアドレス', with: Faker::Internet.email
            fill_in 'パスワード', with: 'password'
            click_button 'ログイン'
            expect(page).to have_content 'ログインしました。'

            # 投稿のページへ
            visit "/posts/#{post.id}"
            expect(page).to have_selector 'h2'

            # いいねをするボタンを押す
            find('#nolike-btn').click
            expect(page).to have_selector '#liking-btn'
            expect(post.likes.count).to eq(1)

            # いいねを解除する
            find('#liking-btn').click
            expect(page).to have_selector '#nolike-btn'
            expect(post.likes.count).to eq(0)
        end
    end
end
