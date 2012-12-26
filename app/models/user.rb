class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :profile_url, :block_count, :alert_count, :nick_count, :password, :password_confirmation, :remember_me, :imei
  # attr_accessible :title, :body
  has_many :comments

  acts_as_api
  acts_as_followable
  acts_as_follower

  api_accessible :user_with_comments do |template|
    template.add :id
    template.add :name
    template.add :email
    template.add :profile_url
    template.add :block_count
    template.add :alert_count
    template.add :nick_count
    template.add :comments
  end

  api_accessible :user_without_comments do |template|
    template.add :id
    template.add :name
    template.add :email
    template.add :profile_url
    template.add :block_count
    template.add :alert_count
    template.add :nick_count
  end

  api_accessible :user_with_comments do |t|
    t.add :comments
  end
end

