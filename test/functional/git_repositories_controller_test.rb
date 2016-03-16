require File.expand_path('../../test_helper', __FILE__)

class GitRepositoriesControllerTest < ActionController::TestCase
  def test_index
    get :index

    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:repositories)
  end

  def test_repositories_initialized_correctly
  	get :index

  	repos = assigns(:repositories)
  	repo = repos.first

  	assert_equal repos.count, 1
  	assert_equal repo.remote_origin_url, "https://github.com/gordev/redmine_remote_git.git"
  	assert_equal repo.local_clone_path, "redmine_remote_git"
  end
end
