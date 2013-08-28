class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :submission_id
      t.integer :person_id
      t.integer :score
      t.boolean :complete, default: false
      t.text :feedback
      t.string :suggested_for_interview

      t.timestamps
    end
  end
end
