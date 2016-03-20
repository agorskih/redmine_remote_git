require File.expand_path('../../test_helper', __FILE__)

class GitRepositoryTest < ActiveSupport::TestCase

  def test_remote_origin_url_should_not_be_nil
  	repo = GitRepository.new(local_clone_path: 'clone')
    refute repo.valid?
  end
end
