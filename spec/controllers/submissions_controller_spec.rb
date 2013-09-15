require 'spec_helper'

describe SubmissionsController do
  let(:person) { Person.create(user_attrs) }
  let(:submission) { Submission.create(submission_attrs.merge(status: "pending")) }
  before do
    session[:uid] = person.id
    person.stub(:submission) { submission }
  end
  
  describe "GET edit" do
    it "is successful" do
      get :edit
      response.should be_success
    end
  end
  
  describe "PATCH update" do
    it "updates" do
      get :update, submission: {resume_url: "1234.com"}
      response.should redirect_to submission_path
    end
    
    it "renders edit" do
      Submission.any_instance.stub(:update) { false }
      get :update, submission: {resume_url: "1234.com"}
      response.should render_template :edit
    end
    
    it "doesn't submit the app" do
      Submission.any_instance.should_not_receive(:submit!)
      get :update, submission: {resume_url: "1234.com"}, commit: "Submit, Nope."
    end
    
    it "submits the app" do
      Submission.any_instance.should_receive(:submit!).and_return(true)
      get :update, submission: {resume_url: "1234.com"}, commit: "Submit Application"
    end
  end
end