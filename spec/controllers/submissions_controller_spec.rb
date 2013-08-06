require 'spec_helper'

describe SubmissionsController do
  let(:person) { Person.find_or_create_by_auth_hash(twitter_hash) }
  before do
    session[:uid] = "123456"
    Person.stub(:find_by).with(uid: "123456") { person }
  end
  
  describe "GET edit" do
    it "is successful" do
      get :edit
      response.should be_success
    end
  end
end