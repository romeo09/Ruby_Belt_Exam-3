class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :members, through: :joins, source: :user

  validates :name, :length => { minimum: 5}, :presence => true
  validates :description, :length => { minimum: 10}, :presence => true
end
