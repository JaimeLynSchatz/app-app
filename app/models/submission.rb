class Submission < ActiveRecord::Base
  has_many :reviews
  belongs_to :person
  
  with_options if: :not_pending? do |submission|
    submission.validates :resume_url, :video_interview_url, :reading_assessment_url, :logic_assessment_url, presence: true
    submission.validates :sponsorship_explaination, presence: { if: :sponsored? }
  end
  
  scope :with_status, lambda { |status| where(status: status) }
  
  def not_pending?
    !pending?
  end
  
  def pending?
    status == "pending"
  end
  
  def sponsored?
    self.financial_position == "sponsored"
  end
end
