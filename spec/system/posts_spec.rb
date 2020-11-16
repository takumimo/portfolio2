require 'rails_helper'

describe 'Postのテスト' do
	describe '新規投稿' do
		let(:user) { create(:user) }
			before do
				visit new_user_session_path
				fill_in 'user[email]', with: Faker::Internet.email
				fill_in 'user[password]', with: user.password
				click_button 'ログイン'
  			end
		context '新規作成画面' do
			it '全て入力できる' do

				visit new_post_path
				fill_in 'post[title]', with: Faker::Lorem.characters(number: 10)
				fill_in 'post[tag_list]', with: Faker::Lorem.characters(number: 5)
				fill_in 'post[text]', with: Faker::Lorem.characters(number: 150)
				click_button '投稿内容を確認する'
				expect(current_path).to eq(posts_confirm_path)
			end
		end

		context '確認画面' do
			# 値がはいっている
			# 投稿ができる
		end
	end

	describe '投稿の編集' do
		visit edit_post_path
		# それぞれ変更を加える
		fill_in 'post[title]', with: Faker::Lorem.characters(number: 10)
		fill_in 'post[tag_list]', with: Faker::Lorem.characters(number: 5)
		fill_in 'post[text]', with: Faker::Lorem.characters(number: 150)
		click_button '更新する'
		expect(current_path).to eq(user_path(current_user))
	end

	describe '投稿の削除' do
		visit post_path(post)
		click_button '削除する'
		expect(current_path).to eq(user_path(current_user))
	end
end