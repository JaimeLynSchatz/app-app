ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def user_attrs
  {
    name: "Bookis",
    email: "b#{rand(9999)}@example.com", 
    password: "gogo1234", 
    password_confirmation: "gogo1234",
    street: "123 fake",
    city: "Seattle",
    state: "Washington",
    postal_code: "98102",
    phone: "2064090810"
  }
end

def submission_attrs
  {
    status:                 "submitted",
    person_id:              1,
    resume_url:             "https://gist.github.com/bookis/6337929",
    reading_assessment_url: "https://gist.github.com/bookis/6337929",
    logic_assessment_url:   "https://gist.github.com/bookis/6337929",
    video_interview_url:    "http://www.youtube.com/watch?v=zB3-FcxXauA",
    wa_resident:            true
  }
end

def twitter_hash
  {
    :provider => "twitter",
    :uid => "123456",
    :info => {
      email: "b#{rand(9999)}@example.com",
      :nickname => "johnqpublic",
      :name => "John Q Public",
      :location => "Anytown, USA",
      :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
      :description => "a very normal guy.",
      :urls => {
        :Website => nil,
        :Twitter => "https://twitter.com/johnqpublic"
      }
    },
    :credentials => {
      :token => "a1b2c3d4...", # The OAuth 2.0 access token
      :secret => "abcdef1234"
    },
    :extra => {
      :access_token => "", # An OAuth::AccessToken object
      :raw_info => {
        :name => "John Q Public",
        :listed_count => 0,
        :profile_sidebar_border_color => "181A1E",
        :url => nil,
        :lang => "en",
        :statuses_count => 129,
        :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
        :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
        :location => "Anytown, USA",
        :time_zone => "Chicago",
        :follow_request_sent => false,
        :id => 123456,
        :profile_background_tile => true,
        :profile_sidebar_fill_color => "666666",
        :followers_count => 1,
        :default_profile_image => false,
        :screen_name => "",
        :following => false,
        :utc_offset => -3600,
        :verified => false,
        :favourites_count => 0,
        :profile_background_color => "1A1B1F",
        :is_translator => false,
        :friends_count => 1,
        :notifications => false,
        :geo_enabled => true,
        :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
        :protected => false,
        :description => "a very normal guy.",
        :profile_link_color => "2FC2EF",
        :created_at => "Thu Jul 4 00:00:00 +0000 2013",
        :id_str => "123456",
        :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
        :default_profile => false,
        :profile_use_background_image => false,
        :entities => {
          :description => {
            :urls => []
          }
        },
        :profile_text_color => "666666",
        :contributors_enabled => false
      }
    }
  }
end