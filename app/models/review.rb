class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "Person", foreign_key: :person_id
  belongs_to :submission
  
  with_options if: :complete do |review|
    review.validates :score, numericality: {greater_than: 0, less_than: 6}
    review.validates :feedback, length: { minimum: 200 }
  end
  
  def person
    submission.person
  end
end
