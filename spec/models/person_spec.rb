require 'spec_helper'

describe Person do
  let(:person) { Person.create(user_attrs) }
  describe "password sign in" do
    
    it "should create a person" do
      expect(person).to be_valid
    end
    
    it "has password errors" do
      person.password = "blah"
      person.valid?
      person.errors[:password_confirmation].should include "doesn't match Password"
    end
  end
  describe "updates from GitHub" do
    before { person; person.update_from_auth_hash(twitter_hash) }
    it "assigns a uid" do
      expect(person.uid).to eq "123456"
    end
    it "assigns a name" do
      expect(person.name).to eq "Bookis"
    end
    it "assigns a handle" do
      expect(person.nickname).to eq "johnqpublic"
    end
    it "assigns an avatar" do
      expect(person.avatar_url).to eq "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
    end

    it "is saved" do
      expect(person.new_record?).to be_false
    end

    it "has a uniq uid" do
      person
      invalid = Person.create(password: "gogo", password_confirmation: "gogo", email: "test@example.com", uid: "123456")
      expect(invalid.errors[:uid]).to include "has already been taken"
    end
    
    it "doesn't change info on find" do
      person
      person.update_from_auth_hash(twitter_hash.merge({info: {nickname: "bookis"}}))
      expect(person.nickname).to eq "johnqpublic"
    end
  end
  
end
