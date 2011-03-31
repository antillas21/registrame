require 'spec_helper'

describe Admin::UsersController do
  let(:user) do
    user = Factory(:user)
    user
  end
  
  context "standard users" do
    before do
      sign_in(:user, user)
    end
    
    it "are not able to access the admin area" do
      get 'index'
      response.should redirect_to(new_user_session_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end
end
