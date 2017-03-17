require 'rails_helper'

describe TweetsController do

  describe 'GET #new' do
    it "newアクションをリクエストした後、new.html.erbに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "アクション内で定義されているインスタンス変数の値が期待したものになるか" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(assigns(:tweet)).to eq tweet
    end

    it "editアクションをリクエストした後、edit.html.erbに遷移するか" do
      tweet = create(:tweet)
      get :edit, id: tweet
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "作成日が降順でソートされたtweetsを取得しているか" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end
end
