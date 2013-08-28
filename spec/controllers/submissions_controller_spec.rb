require 'spec_helper'

describe SubmissionsController do
  let(:person) { Person.create(user_attrs) }
  before do
    session[:uid] = "123456"
    Person.stub(:find).with("123456") { person }
  end
  
  describe "GET edit" do
    it "is successful" do
      get :edit
      response.should be_success
    end
  end
end