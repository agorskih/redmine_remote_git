require File.expand_path('../../test_helper', __FILE__)

class GitRepositoriesControllerTest < ActionController::TestCase
  fixtures :git_repositories

  remote = 'https://github.com/gordev/redmine_remote_git.git'
  clone = 'redmine_remote_git'

  '''def test_create
  	assert_difference GitRepository.all, +1 do
	  	post(:create, repo: { remote_origin_url: remote, local_clone_path: clone + " copy"})

	  	assert_response :success
	  	assert_template "index"
	  	assert_not_nil assigns(:repositories)
	  end
  end'''

  def test_index
    get :index

    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:repositories)
  end

  def test_repositories_are_loaded_from_db
  	get :index

  	repos = assigns(:repositories)
  	repo = repos.first

  	assert_equal repos.count, 2

  	for repo in repos do
  		assert_equal repo.remote_origin_url, remote
  		assert_equal repo.local_clone_path, clone
  	end
  end

  def test_should_contain_one_table
  	get :index

  	assert_select 'table', 1
  end

  def test_total_rows_in_table_equals_total_repositories
  	get :index

  	assert_select 'table' do
  		assert_select 'tr', 2
  	end
  end

  def test_should_contain_table_with_repositories
  	get :index

  	assert_select 'table' do
  		assert_select 'tr' do
  			assert_select 'td', 4
  			assert_select 'td' do 
					assert_select 'td:nth-child(1)', remote
					assert_select 'td:nth-child(2)', clone
				end
  		end
  	end
  end
end
