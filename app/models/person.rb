class Person < ActiveRecord::Base
  has_one :submission
  validates :uid, uniqueness: true
  private

  def self.find_or_create_by_auth_hash(auth_hash)
    Person.find_or_create_by(uid: auth_hash[:uid]) do |person|
      person.name       = auth_hash[:info][:name]
      person.nickname   = auth_hash[:info][:nickname]
      person.email      = auth_hash[:info][:email]
      person.avatar_url = auth_hash[:info][:image]
    end
  end

end
