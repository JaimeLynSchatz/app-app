require 'spec_helper'

describe Submission do
  describe "pending" do
    it "is pending" do
      Submission.new.status.should eq "pending"
    end
    it "is valid" do
      Submission.new.should be_valid
    end
  end

  let(:submission) { Submission.create(submission_attrs) }
  
  it "is valid" do
    submission.should be_valid
  end
  
  it "isn't valid without url" do
    submission.resume_url = nil
    submission.should_not be_valid
  end
  it "isn't valid without video url" do
    submission.video_interview_url = nil
    submission.should_not be_valid
  end
  
  it "isn't valid without url" do
    submission.existing_financial_sponsorship = true
    submission.should_not be_valid
  end
  
end
