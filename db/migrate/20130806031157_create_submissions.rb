class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :resume_url, :video_interview_url, :twitter_handle, :website_url, :linkdin_url
      t.string :status, default: :pending
      t.text :sponsorship_explaination
      t.boolean :wa_resident, :wa_student, :existing_financial_sponsorship, default: false
      t.integer :person_id

      t.timestamps
    end
  end
end
