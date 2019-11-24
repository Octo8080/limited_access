class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  enum status: [untreated:0,used:1]
  has_many :access
  has_many :users, through: :access
end
