class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :status
      t.integer :person_id

      t.timestamps
    end
  end
end
