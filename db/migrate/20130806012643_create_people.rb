class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :nickname, :uid
      t.string :avatar_url
      t.string :phone

      t.timestamps
    end
    add_index :people, :uid
  end
end