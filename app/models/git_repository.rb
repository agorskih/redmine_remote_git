class GitRepository < ActiveRecord::Base
  unloadable
  validates :remote_origin_url, local_clone_path, presence: true
end
