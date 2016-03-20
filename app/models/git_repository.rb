class GitRepository < ActiveRecord::Base
  unloadable
  validates :remote_origin_url, presence: true
end
