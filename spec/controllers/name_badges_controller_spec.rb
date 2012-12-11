require 'spec_helper'

describe NameBadgesController do
  
  let(:user) do
    user = Factory(:user)
    user
  end
  
  let(:name_badge) do
    name_badge = Factory(:name_badge)
    name_badge
  end
  
  context "standard users" do
    { "edit" => "get", "update" => "put" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => name_badge.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end
  end
  
end
