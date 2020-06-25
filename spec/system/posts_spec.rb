require 'rails_helper'

describe '投稿機能', type: :system do
  let(:user_a) { FactoryBot.create(:user_a) }
  let(:user_b) { FactoryBot.create(:user_b) }
  let(:user_a_login) {
    visit user_session_path
    fill_in 'user[email]', with: user_a.email
    fill_in 'user[password]', with: user_a.password
    click_button 'Log in'
  }
  let(:user_b_login) {
    visit user_session_path
    fill_in 'user[email]', with: user_a.email
    fill_in 'user[password]', with: user_a.password
    click_button 'Log in'
  }

  describe '投稿新規作成機能' do
    before do
      user_a
      user_a_login
    end

    context '有効な値を入力する' do
      it '新規登録が完了する' do
        fill_in 'post[title]', with: 'test投稿'
        fill_in 'post[content]', with: 'test'
        fill_in 'post[url]', with: 'test'
        click_button '新たなイチゲイを投稿'
        expect(page).to have_content 'test投稿'
      end
    end

    context '無効な値を入力する' do
      it '登録されない' do
        click_button '新たなイチゲイを投稿'
        expect(page).to have_content 'エラー'
      end
    end
  end

  describe '投稿詳細' do
    let(:post) { Post.create(title: 'test投稿', content: 'test投稿', url: 'test', user_id: user_a.id) }
    before do
      user_a
      user_a_login
      post
      visit posts_path
    end

    context '投稿一覧画面' do
      it '投稿詳細に遷移できる' do
        click_on 'test投稿'
        expect(page).to have_content 'イチゲイ詳細'
        expect(page).to have_content 'test投稿'
      end

      # it '投稿にいいねできる' do
      #   click_on '登録'
      #   expect(page).to have_content '解除'
      # end

      # it '投稿を削除できる' do
      #   click_on '削除'
      #   expect(page).to have_no_content 'test投稿'
      # end
    end
  end

end
