require 'spec_helper'

describe SectorsController do
  let(:user) do
    user = Factory(:user)
    user
  end
  
  let(:sector) do
    sector = Factory(:sector)
    sector
  end
  
  context "standard users" do
    { "new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => sector.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end
  end
end
