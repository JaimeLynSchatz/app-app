class AddReadingAssessmentUrlToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :reading_assessment_url, :string
    add_column :submissions, :logic_assessment_url, :string
    add_column :submissions, :us_citizen, :boolean, default: false
    add_column :submissions, :financial_position, :string
    remove_column :submissions, :existing_financial_sponsorship
  end
end