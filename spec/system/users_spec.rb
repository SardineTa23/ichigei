require 'rails_helper'

describe 'ユーザー機能', type: :system do
  let(:user) { FactoryBot.create(:user_a) }

  describe '新規登録機能' do
    before do
      visit new_user_registration_path
      fill_in 'user[name]', with: user_name
      fill_in 'user[display_name]', with: user_display_name
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password
      fill_in 'user[password_confirmation]', with: user_password
      click_button 'Sign up'
    end

    context '有効な値を入力する' do
      let(:user_name) { 'test_a' }
      let(:user_email) { 'test_a@test.com' }
      let(:user_password) { 'password' }
      let(:user_display_name) { 'test_a' }

      it '新規登録が完了する' do
        expect(page).to have_content 'ログアウト'
      end
    end

    context '無効な値を入力する' do
      let(:user_name) { '' }
      let(:user_email) { '' }
      let(:user_password) { '' }
      let(:user_display_name) {''}
      it '登録されない' do
        expect(page).to have_content 'エラー'
      end
    end
  end

  describe 'ログイン機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: user_email
      fill_in 'user[password]', with: user_password
      click_button 'Log in'
    end

    context '有効な値を入力する' do
      let(:user_email) { user.email }
      let(:user_password) { user.password }

      it 'ログインに成功する' do
        expect(page).to have_content 'ログアウト'
      end
    end

    context '無効な値を入力する' do
      let(:user_email) { '' }
      let(:user_password) { '' }

      it 'ログインに失敗する' do
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end

  describe 'ログアウト機能' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      click_on 'ログアウト'
    end

    context 'ログイン中にログアウトボタンを押す' do
      it 'ログアウト処理される' do
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'プロフィール編集機能' do
    let(:user_b) {FactoryBot.create(:user_b) }
    before do
      visit user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      visit edit_user_path(user)
      fill_in 'user[display_name]', with: user_name
      click_button 'プロフィールを更新する'
    end

    context 'ログインしているユーザーの編集情報を送信した時' do
      let(:user_name) { 'user_a_edit' }
      it '有効な値を送信した場合' do
        expect(page).to have_content 'user_a_edit'
      end
    end

    context '無効な値を送信した場合' do
      let(:user_name) { '' }
      it '編集ページがrenderされる' do
        expect(page).to have_content 'エラー'
      end
    end
  end
end
