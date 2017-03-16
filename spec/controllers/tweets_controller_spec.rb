require 'rails_helper'

describe TweetsController do

  describe 'GET #new' do
    it "newアクションをリクエストした後、new.html.erbに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

end
