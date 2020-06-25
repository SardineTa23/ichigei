require 'rails_helper'

describe '求人機能', type: :system do
  let(:user_a) { FactoryBot.create(:user_a) }
  let(:user_b) { FactoryBot.create(:user_b) }
  let(:user_a_login) {
    visit user_session_path
    user_a
    fill_in 'user[email]', with: user_a.email
    fill_in 'user[password]', with: user_a.password
    click_button 'Log in'
  }
  let(:user_b_login) {
    visit user_session_path
    user_b
    fill_in 'user[email]', with: user_b.email
    fill_in 'user[password]', with: user_b.password
    click_button 'Log in'
  }

  describe '求人新規作成機能' do
    before do
      user_a
      user_a_login
    end

    context '有効な値を入力する' do
      it '新規登録が完了する' do
        visit new_work_path
        fill_in 'work[title]', with: 'test求人'
        fill_in 'work[description]', with: 'test'
        fill_in 'work[condition]', with: 'test'
        fill_in 'work[reward]', with: '1000'
        click_button '求人を作成する'
        expect(page).to have_content 'test求人'
      end
    end

    context '無効な値を入力する' do
      it '登録されない' do
        visit new_work_path
        click_button '求人を作成する'
        expect(page).to have_content 'エラー'
      end
    end
  end

  describe '求人詳細' do
    let(:work) { Work.create(title: 'test求人', description: 'test投稿', condition: 'test', user_id: user_a.id, 
                             started_at: Time.now, ended_at: Time.now, reward: 1000) }
    before do
      user_a_login
      work
      visit works_path
    end

    describe '求人一覧画面' do
      context '求人を作成したユーザー' do
        it '投稿詳細に遷移できる' do
          click_on 'test求人'
          expect(page).to have_content '求人詳細'
          expect(page).to have_content 'test求人'
        end

        it '編集画面に遷移する' do
          click_on 'test求人'
          click_on 'この求人を編集する'
          expect(page).to have_content '募集の編集'
        end

        it '編集に成功する' do
          click_on 'test求人'
          click_on 'この求人を編集する'
          fill_in 'work[title]', with: 'テスト求人編集'
          click_button '求人を更新する'
          expect(page).to have_content 'テスト求人編集'
        end

        it '編集に失敗する' do
          click_on 'test求人'
          click_on 'この求人を編集する'
          fill_in 'work[title]', with: ''
          click_button '求人を更新する'
          expect(page).to have_content 'エラー'
        end
      end

      context '求人を作成ユーザーではないとき' do
        before do
          click_on 'ログアウト'
          user_b_login
          visit works_path
        end
        it '求人詳細に遷移できる' do
          click_on 'test求人'
          expect(page).to have_content '求人詳細'
          expect(page).to have_content 'test求人'
          expect(page).to have_no_content 'この求人を編集'
        end

        it '求人編集画面に遷移できない' do
          edit_work_path(work)
          expect(page).to have_content 'マイページ'
        end
      end
    end
  end

end
