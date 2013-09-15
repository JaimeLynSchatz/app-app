require 'spec_helper'

describe Admin::PeopleController, type: :controller do
  let(:person) { Person.create(user_attrs.merge(role: "admin")) }
  let(:reviewer) { mock_model(Person) }
  let(:mailer) { double("mailer") }
  before do
    session[:uid] = "1"
    Person.stub(:find) { reviewer }
    Person.stub(:find).once.with("1") { person }
  end
  
  describe "unlock" do
    describe "success" do
      before do
        mailer.stub(:deliver)
        PersonMailer.should_receive(:reviewer_accepted).with(reviewer.id).and_return(mailer)
      end
      it "redirects" do
        reviewer.should_receive(:update).with(locked: false).and_return(true)
        patch :unlock, id: reviewer.id
        response.should redirect_to admin_people_path
      end
      it "sends email" do
        reviewer.should_receive(:update).with(locked: false).and_return(true)
        patch :unlock, id: reviewer.id
      end
    end
    
    it "updates the locked" do
      reviewer.should_receive(:update).with(locked: false).and_return(false)
      PersonMailer.should_not_receive(:reviewer_accepted)
      patch :unlock, id: reviewer.id
    end
  end
end