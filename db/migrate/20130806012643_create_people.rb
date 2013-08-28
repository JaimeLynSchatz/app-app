class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email, :password_digest
      t.string :role, default: "applicant"
      t.string :nickname, :uid
      t.string :avatar_url
      t.string :phone, :street, :street_two, :city, :state, :postal_code
      t.boolean :locked, default: false
      t.timestamps
    end
    add_index :people, :uid
  end
end