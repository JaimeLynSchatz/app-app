require "spec_helper"

describe PeopleController do
  let(:person) { Person.create(user_attrs) }
  before do
    person.update_from_auth_hash(twitter_hash)
    session[:uid] = "1"
    Person.stub(:find).with("1") { person }
  end

  describe "POST create" do
    let(:create) { post :create, person: user_attrs }
    it "redirects" do
      create
      expect(response).to be_redirect
    end

    it "creates a user" do
      expect { create }.to change(Person, :count).by(1)
    end
    
    it "assigns a current user" do
      create
      session[:uid].should eq assigns(:person).id
    end
    
    describe "fail" do
      before { Person.any_instance.stub(:save) { false } }
      
      it "redirects to sign up" do
        create
        expect(response).to render_template :new
      end
    end
  end

  describe "GET new" do
    it "renders a page" do
      get :new
      expect(response).to be_success
    end
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