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
  
  %w(resume_url video_interview_url reading_assessment_url logic_assessment_url).each do |field|
    it "isn't valid without #{field}" do
      submission.send("#{field}=", nil)
      submission.should_not be_valid
    end
  end
  
  it "isn't valid when sponsored without explaination" do
    submission.financial_position = "sponsored"
    submission.should_not be_valid
  end

  it "is valid when sponsored with explaination" do
    submission.financial_position = "sponsored"
    submission.sponsorship_explaination = "lorem ipsum"
    submission.should be_valid
  end
  
end
