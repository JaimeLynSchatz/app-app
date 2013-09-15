class Person < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :email, :name, presence: true
  
  with_options if: :applicant? do |person|
    person.validates :street, :city, :state, :postal_code, :phone, presence: true
  end

  has_one :submission
  has_many :reviews
  
  validates :uid, uniqueness: { allow_blank: true }
  scope :with_role, lambda {|role| where(role: role) }
  
  def update_from_auth_hash(auth_hash)
    self.uid        = auth_hash[:uid]             if self.uid.blank?
    self.name       = auth_hash[:info][:name]     if self.name.blank?
    self.nickname   = auth_hash[:info][:nickname] if self.nickname.blank?
    self.email      = auth_hash[:info][:email]    if self.email.blank?
    self.avatar_url = auth_hash[:info][:image]    if self.avatar_url.blank?
    self.save!
  end
  
  def has_role?(word)
    if word.is_a? Array
      word.include? role.try(:to_sym)
    else
      role.try(:to_sym) == word.try(:to_sym)
    end
  end
  
  def can?(word)
    case word
    when :review then [:admin, :reviewer].include? self.role.to_sym
    when :admin then self.role.to_sym == :admin
    else
      false
    end
  end
  
  def applicant?
    self.role.to_sym == :applicant
  end
  
  def unlocked?
    !self.locked?
  end
  
  def reviewed?(person)
    reviews.where(submission_id: person.submission.id).any?
  end
  
  def admin?
    role == "admin"
  end
  
end
