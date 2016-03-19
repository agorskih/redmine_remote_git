require File.expand_path('../../test_helper', __FILE__)

class GitRepositoriesControllerTest < ActionController::TestCase
  fixtures :git_repositories

  def test_new_git_repository
  	get :new_git_repository_path

  	assert_response :success
    assert_template 'new'
  end

  def test_page_should_contain_add_button
  	get :index

  	assert_select 'a', { :href => new_git_repository_path, :text => 'Add repository' }
  end

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
  		assert_equal repo.remote_origin_url, 'https://github.com/gordev/redmine_remote_git.git'
  		assert_equal repo.local_clone_path, 'redmine_remote_git'
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
					assert_select 'td:nth-child(1)', 'https://github.com/gordev/redmine_remote_git.git'
					assert_select 'td:nth-child(2)', 'redmine_remote_git'
				end
  		end
  	end
  end
end
