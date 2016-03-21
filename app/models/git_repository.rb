require 'uri'

class GitRepository < ActiveRecord::Base
  unloadable
  validates :remote_origin_url, :local_clone_path, presence: true 
  validates :local_clone_path, uniqueness: true
  validate :remote_origin_url_format_must_be_valid

  def remote_origin_url_format_must_be_valid
  	!!URI.parse(remote_origin_url)
	rescue URI::InvalidURIError
	  errors.add(:remote_origin_url, 'invalid url format')
  end
end
