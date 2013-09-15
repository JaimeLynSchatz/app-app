require "spec_helper"

describe PersonMailer do
  before { Person.stub(:find).with(1) { stub_model(Person, email: "b@e.com", name: "Bookis")} }
  describe "thanks_for_applying" do
    let(:mail) { PersonMailer.thanks_for_applying(1) }
    
    it "renders the headers" do
      mail.subject.should eq("Thanks for applying")
      mail.to.should eq(["b@e.com"])
      mail.from.should eq(["contact@adadevelopersacademy.org"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Bookis")
    end
  end

  describe "reviewer_accepted" do
    let(:mail) { PersonMailer.reviewer_accepted(1) }

    it "renders the headers" do
      mail.subject.should eq("Reviewer accepted")
      mail.to.should eq(["b@e.com"])
      mail.from.should eq(["contact@adadevelopersacademy.org"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Bookis")
    end
  end

  describe "interview_invite" do
    let(:mail) { PersonMailer.interview_invite(1) }

    it "renders the headers" do
      mail.subject.should eq("Interview invite")
      mail.to.should eq(["b@e.com"])
      mail.from.should eq(["contact@adadevelopersacademy.org"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Bookis")
    end
  end

end
