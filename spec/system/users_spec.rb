require 'rails_helper'

RSpec.describe User, type: :system do
	describe 'ユーザーのテスト' do
	    let(:user){create(:user)}
		describe 'User CRUD' do
		    describe 'ログイン前' do
		      	describe 'ユーザー新規登録' do
		        	context 'フォームの入力値が正常' do
		        		it 'ユーザーの新規作成が成功' do
						    # ユーザー新規登録画面へ遷移
						    visit new_user_registration_path
						    fill_in '名前', with: 'testname'
						    # Emailテキストフィールドにtest@example.comと入力
						    fill_in 'メールアドレス', with: 'test@example.com'
						    # Passwordテキストフィールドにpasswordと入力
						    fill_in 'パスワード', with: 'password'
						    # Password confirmationテキストフィールドにpasswordと入力
						    fill_in '確認用パスワード', with: 'password'
						    # SignUpと記述のあるsubmitをクリックする
						    click_button '登録'
						    # login_pathへ遷移することを期待する
						    expect(current_path).to eq posts_path
						    # 遷移されたページに'User was successfully created.'の文字列があることを期待する
						    expect(page).to have_content 'アカウント登録が完了しました。'
						end

		        	end
		        	context 'メールアドレス未記入' do
		        		it 'ユーザーの新規作成が失敗' do
						    # ユーザー新規登録画面へ遷移
						    visit new_user_registration_path
						    fill_in '名前', with: nil
						    # Emailテキストフィールドをnil状態にする
						    fill_in 'メールアドレス', with: nil
						    # Passwordテキストフィールドにpasswordと入力
						    fill_in 'パスワード', with: nil
						    # Password confirmationテキストフィールドにpasswordと入力
						    fill_in '確認用パスワード', with: nil
						    # SignUpと記述のあるsubmitをクリックする
						    click_button '登録'
						    # users_pathへ遷移することを期待する
						    expect(current_path).to eq new_user_registration_path
						    # 遷移されたページに'Email can't be blank'の文字列があることを期待する
						    expect(page).to have_content "エラーが発生したため ユーザー は保存されませんでした。"
  						end
		        	end
		        	context '登録済メールアドレス' do
		        		it 'ユーザーの新規作成が失敗する' do
						    # ユーザー新規登録画面へ遷移
						    visit new_user_registration_path
						    fill_in '名前', with: 'testname'
						    # Emailテキストフィールドにlet(:user)に定義したユーザーデータのemailを入力
						    fill_in 'メールアドレス', with: user.email
						    # Passwordテキストフィールドにpasswordと入力
						    fill_in 'パスワード', with: 'password'
						    # Password confirmationテキストフィールドにpasswordと入力
						    fill_in '確認用パスワード', with: 'password'
						    # SignUpと記述のあるsubmitをクリックする
						    click_button 'SignUp'
						    # users_pathへ遷移することを期待する
						    expect(current_path).to eq new_user_registration_path
						    # 遷移されたページに'Email can't be blank'の文字列があることを期待する
						    expect(page).to have_content "メールアドレス はすでに使用されています。"
  						end

		        	end
		      	end
		    end
		    describe 'ログイン後' do
		      	describe 'ユーザー編集' do
		        	context 'フォームの入力値が正常' do
		        		it 'ユーザーの編集が成功' do
			              visit edit_user_path(user)
			              fill_in 'メールアドレス', with: 'test@example.com'
			              fill_in '自己紹介', with: 'texttexttext'
			              fill_in '名前', with: 'testname'
			              click_button '更新する'
			              expect(current_path).to eq user_path(user)
            			end

		        	end
		        	context 'メールアドレス未記入' do
		        		it 'ユーザーの編集が失敗' do
						    visit edit_user_path(user)
						    fill_in 'メールアドレス', with: nil
						    fill_in '自己紹介', with: 'texttexttext'
						    fill_in '名前', with: ' testname'
						    click_button '更新'
						    expect(current_path).to eq edit_user_path(user)
  						end

		        	end
		    	end
	  		end
	  	end
	end
end