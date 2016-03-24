require 'uri'

class GitRepository < ActiveRecord::Base
  unloadable
  validates :remote_origin_url, :local_clone_path, presence: true 
  validates :local_clone_path, uniqueness: true
  validate :remote_origin_url_must_be_HTTP_or_HTTPS_URL

  def remote_origin_url_must_be_HTTP_or_HTTPS_URL
  	uri = URI.parse(remote_origin_url)
  	unless uri.kind_of?(URI::HTTP)
  		raise URI::InvalidURIError
  	end
	rescue URI::InvalidURIError
	  errors.add(:remote_origin_url, 'remote origin URL is not HTTP/HTTPS URL')
  end

  def clone
    
  end

end
