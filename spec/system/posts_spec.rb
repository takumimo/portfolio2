require 'rails_helper'

RSpec.describe 'Postのテスト', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '新規投稿' do
    context '新規作成画面' do
      it '確認画面に移動' do
        visit new_post_path
        fill_in 'post[title]', with: Faker::Lorem.characters(number: 10)
        fill_in 'post[tag_list]', with: Faker::Lorem.characters(number: 5)
        fill_in 'post[text]', with: Faker::Lorem.characters(number: 150)
        click_button '投稿内容を確認する'
        expect(current_path).to eq(posts_confirm_path)
      end
      it '投稿を完了' do
        visit new_post_path
        fill_in 'post[title]', with: Faker::Lorem.characters(number: 10)
        fill_in 'post[tag_list]', with: Faker::Lorem.characters(number: 5)
        fill_in 'post[text]', with: Faker::Lorem.characters(number: 150)
        click_button '投稿内容を確認する'
        click_button '投稿する'
        expect(page).to have_content('投稿が完了しました')
      end
    end
  end

  describe '投稿の編集' do
    before do
      visit edit_post_path(post)
    end

    it '変更を加える' do
      fill_in 'post[title]', with: Faker::Lorem.characters(number: 10)
      fill_in 'post[tag_list]', with: Faker::Lorem.characters(number: 5)
      fill_in 'post[text]', with: Faker::Lorem.characters(number: 150)
      click_button '更新する'
      expect(page).to have_content('更新しました')
    end
  end

  describe '投稿の削除' do
    before do
      visit post_path(post)
    end

    it '投稿を削除' do
      click_on '削除する'
      expect(page).to have_content('削除しました')
    end
  end
end
