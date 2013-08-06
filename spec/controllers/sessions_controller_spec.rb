require 'spec_helper'

describe SessionsController do
  before do
    Person.should_receive(:find_or_create_by_auth_hash).once.and_return(Person.new(uid: "123456"))
  end
  describe "GET create" do
    let(:create) { get :create, provider: "twitter" }
    
    it "assigns a session" do
      create
      session[:uid].should eq "123456"
    end
    
    it "redirects to the users current step" do
      create
      response.should redirect_to profile_path
    end
  end
end