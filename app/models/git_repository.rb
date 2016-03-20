class GitRepository < ActiveRecord::Base
  unloadable
  validates :remote_origin_url, :local_clone_path, presence: true
  validates :local_clone_path, uniqueness: true
end
