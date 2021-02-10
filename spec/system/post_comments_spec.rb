# require 'rails_helper'

# RSpec.describe 'コメント機能', type: :system do
#   describe 'show画面でコメントする' do
#     let(:user) { create(:user) }
#     let!(:test_user2) { create(:user) }
#     let!(:post) { create(:post) }
#     let!(:post_2) { create(:post) }

#     before do
#       visit new_user_session_path
#       fill_in 'user[email]', with: user.email
#       fill_in 'user[password]', with: user.password
#       click_button 'ログイン'
#     end

#     describe 'コメントする' do
#         it 'コメント成功' do
#           visit post_path(post_2)
#           click_on '注目する'
#           fill_in 'post_comment[text]', with: Faker::Lorem.characters(number: 10)
#           click_on 'コメントする'
#           expect(page).to have_content '相談詳細'
#         end
#         it 'コメント失敗' do
#           visit post_path(post_2)
#           click_on '注目する'
#           fill_in 'post_comment[text]', with: ''
#           click_button 'コメントする'
#           expect(current_path).to eq(post_path(post_2))
#         end
#     end
#   end
# end
