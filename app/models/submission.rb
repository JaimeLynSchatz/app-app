class Submission < ActiveRecord::Base
  include AASM
  has_many :reviews
  belongs_to :person
  
  with_options if: :not_pending? do |submission|
    submission.validates :resume_url, :video_interview_url, :reading_assessment_url, :logic_assessment_url, presence: true
    submission.validates :sponsorship_explaination, presence: { if: :sponsored? }
  end
  
  scope :with_status, lambda { |status| where(status: status) }
  
  aasm column: :status do
    state :pending, :initial => true
    state :submitted, after_enter: :send_submission_accepted_email
    event :submit do
      transitions :from => :pending, :to => :submitted
    end
  end
  
  def not_pending?
    !pending?
  end
  
  def pending?
    status == "pending"
  end
  
  def sponsored?
    self.financial_position == "sponsored"
  end
  
  def send_submission_accepted_email
    PersonMailer.thanks_for_applying(self.person_id).deliver
  end
  
end
