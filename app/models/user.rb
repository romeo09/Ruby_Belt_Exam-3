class User < ActiveRecord::Base
   has_many :groups
   has_many :joins, dependent: :destroy
   has_many :groups_joined, through: :joins, source: :group
   has_secure_password

   email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

   validates :fname, :presence => true
   validates :lname, :presence => true
   validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
   validates :password, :length => { minimum: 8 }, :presence => true
   validates_presence_of :password, on: :new
   validates_confirmation_of :password, :allow_blank => false
end
