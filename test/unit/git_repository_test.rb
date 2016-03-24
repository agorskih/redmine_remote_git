require File.expand_path('../../test_helper', __FILE__)
require 'git'
require 'fileutils'

class GitRepositoryTest < ActiveSupport::TestCase
	fixtures :git_repositories

	def test_clone
		FileUtils.rm_rf(ENV['OPENSHIFT_DATA_DIR'] + '/test.git')

		repo = GitRepository.new(remote_origin_url: 'https://github.com/gordev/redmine_remote_git.git', local_clone_path: 'test.git' )
		repo.clone

		assert_not_nil ENV['OPENSHIFT_DATA_DIR']

		assert_nothing_raised do
			g = Git.bare(ENV['OPENSHIFT_DATA_DIR'] + '/test.git', :log => Logger.new(STDOUT))
		end

		repo.destroy

		assert_raises ArgumentError do
			g = Git.bare(ENV['OPENSHIFT_DATA_DIR'] + '/test.git', :log => Logger.new(STDOUT))
		end
	end

	def test_only_valid_url_should_be_allowd
		repo = GitRepository.new(remote_origin_url: 'invalid://url', local_clone_path: 'redmine_remote_git copy')
		refute repo.valid?
		assert_equal(repo.errors[:remote_origin_url], ['remote origin URL is not HTTP/HTTPS URL'])
		assert_equal(repo.errors[:local_clone_path], [])
	end

	def test_clone_path_should_be_unique
		repo = GitRepository.new(remote_origin_url: 'https://github.com/gordev/redmine_remote_git.git', local_clone_path: 'redmine_remote_git')
		refute repo.valid?
	end

	def test_local_clone_path_should_be_present
		repo = GitRepository.new(remote_origin_url: 'https://github.com/gordev/redmine_remote_git.git')
    refute repo.valid?
	end

  def test_remote_origin_url_should_be_present
  	repo = GitRepository.new(local_clone_path: 'redmine_remote_git copy')
    refute repo.valid?
  end
end
