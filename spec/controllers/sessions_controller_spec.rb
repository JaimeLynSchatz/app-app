require 'spec_helper'

describe SessionsController do
  let(:person) { Person.create(user_attrs) }
  
  describe "GET new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end
  
  describe "POST create" do
    before do
      Person.should_receive(:find_by_email).once.and_return(person)
    end
    
    let(:create) { post :create, {email: "b@example.com", password: "gogo"} }
    
    describe "authed" do
      before { person.stub(:authenticate).with("gogo").and_return(true) }

      it "assigns a session" do
        create
        session[:uid].should eq person.id
      end

      it "redirects to the users current step" do
        create
        response.should redirect_to root_path
      end
    end
    
    describe "un-authed" do
      before { person.stub(:authenticate).with("gogo").and_return(false) }

      it "assigns a session" do
        create
        session[:uid].should nil
      end

      it "redirects to the users current step" do
        create
        response.should render_template :new
      end
    end
    
  end
end