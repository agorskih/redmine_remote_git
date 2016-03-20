require File.expand_path('../../test_helper', __FILE__)

class GitRepositoryTest < ActiveSupport::TestCase

	def test_local_clone_path_should_be_present
		repo = GitRepository.new(remote_origin_url: 'https://github.com/gordev/redmine_remote_git.git')
    refute repo.valid?
	end

  def test_remote_origin_url_should_be_present
  	repo = GitRepository.new(local_clone_path: 'clone')
    refute repo.valid?
  end
end
