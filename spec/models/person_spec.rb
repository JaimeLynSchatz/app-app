require 'spec_helper'

describe Person do
  describe "create from twitter" do
    let(:person) { Person.find_or_create_by_auth_hash(twitter_hash) }
    it "assigns a uid" do
      expect(person.uid).to eq "123456"
    end
    it "assigns a name" do
      expect(person.name).to eq "John Q Public"
    end
    it "assigns a handle" do
      expect(person.twitter_handle).to eq "johnqpublic"
    end
    it "assigns an avatar" do
      expect(person.avatar_url).to eq "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
    end

    it "is saved" do
      expect(person.new_record?).to be_false
    end

    it "has a uniq uid" do
      person
      invalid = Person.create(uid: "123456")
      expect(invalid.errors[:uid]).to include "has already been taken"
    end
    
    it "returns an existing user" do
      person
      expect(Person.find_or_create_by_auth_hash(twitter_hash)).to eq person
    end
    
    it "doesn't change info on find" do
      person
      found_person = Person.find_or_create_by_auth_hash(twitter_hash.merge({info: {nickname: "bookis"}}))
      expect(found_person.twitter_handle).to eq "johnqpublic"
    end
  end
end
