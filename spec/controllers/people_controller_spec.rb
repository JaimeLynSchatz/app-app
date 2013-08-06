require "spec_helper"

describe PeopleController do
  let(:person) { Person.find_or_create_by_auth_hash(twitter_hash) }
  before do
    session[:uid] = "123456"
    Person.stub(:find_by).with(uid: "123456") { person }
  end
  
  describe "GET edit" do
    it "is successful" do
      get :edit
      expect(response).to be_success
    end
  end
  
  describe "PATCH update" do
    it "updates name" do
      patch :update, person: {name: "Bookis Smuin"}
      assigns(:user).name.should eq "Bookis Smuin"
    end
    it "doesn't update uid" do
      patch :update, person: {uid: "654321"}
      assigns(:user).uid.should eq "123456"
    end
    
    it "updates name" do
      patch :update, person: {email: "bookis@ada.com"}
      assigns(:user).email.should eq "bookis@ada.com"
    end
    it "updates name" do
      patch :update, person: {phone: "206409081"}
      assigns(:user).phone.should eq "206409081"
    end
  end
end