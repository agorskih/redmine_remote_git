require File.expand_path('../../test_helper', __FILE__)

class GitRepositoriesControllerTest < ActionController::TestCase
  fixtures :git_repositories

  def test_new_should_not_contain_errors
    get :new

    assert_select 'form', { :id => 'repository', :action => '/git_repositories' } do
      assert_select 'label', { :id => 'remote_origin_url_error', :value => '', :count => 1 }
      assert_select 'label', { :id => 'local_clone_path_error', :value => '', :count => 1 }
    end
  end

  def test_create_should_show_errors
    post :create, :git_repository => { :remote_origin_url => 'invalid://http/url' }

    assert_select 'form', { :id => 'repository', :action => '/git_repositories' } do
      assert_select 'label', { :id => 'remote_origin_url_error', :value => 'remote origin URL is not HTTP/HTTPS URL', :count => 1 }
      assert_select 'label', { :id => 'local_clone_path_error', :value => '', :count => 1 }
    end
  end

  def test_create_should_allow_to_fix_errors_in_case_save_failing
    post :create, :git_repository => { :remote_origin_url => 'invalid://http/url' }

    assert_select 'form', { :id => 'repository', :action => '/git_repositories' } do
      assert_select 'input', { :id => 'repository_remote_origin_url', :name => 'repository[remote_origin_url]', :type => 'text', :value =>  'invalid://http/url', :count => 1 }
      assert_select 'input', { :id => 'repository_local_clone_path', :name => 'repository[local_clone_path]', :type => 'text', :value => '', :count => 1 }
      assert_select 'form input[type=submit][value=Create][name=commit]', 1

      assert_select 'label', 'repository remote origin url:', 1
      assert_select 'label', 'repository local clone path:', 1
    end
  end

  def test_new_should_redirect_to_index_upon_successful_repository_creation
    post :create, :git_repository => { :remote_origin_url => "https://github.com/gordev/redmine_remote_git.git", :local_clone_path => "redmine_remote_git copy" }

    assert_redirected_to action: 'index'
  end

  def test_form_should_be_inside_table
    get :new

    assert_select 'table', 1 do
      assert_select 'tr', 3
      assert_select 'td', 6 
      assert_select 'input', 3
    end
  end

  def test_create_should_add_repository_to_db
  	assert_difference 'GitRepository.all.count', +1 do
	  	post :create, :git_repository => { :remote_origin_url => "https://github.com/gordev/redmine_remote_git.git", :local_clone_path => "redmine_remote_git copy" }
  	end
  end

  def test_new_should_contain_form
  	get :new

    #assert_select 'form table tr td input[type=text][id=remote_origin_url]', 1



  	assert_select 'form', { :id => 'repository', :action => '/git_repositories' } do
  		
      assert_select "input[type=text][id='repository_remote_origin_url']", 1

  		#assert_select 'form input[type=text][id=repository_local_clone_path]', 1
  		assert_select 'form input[type=submit][value=Create][name=commit]', 1

  		assert_select 'label', 'repository remote origin url:'
  		assert_select 'label', 'repository local clone path:'
  	end
  end

  def test_new
  	get :new

  	assert_response :success
    assert_template 'new'
  end

  def test_index_should_contain_add_button
  	get :index

  	assert_select 'a', { :href => new_git_repository_path, :text => 'Add repository', :count => 1 }
  end

  def test_index
    get :index

    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:repositories)
  end

  def test_index_should_load_repositories_from_db
  	get :index

  	repos = assigns(:repositories)
  	repo = repos.first

  	assert_equal repos.count, 2

  	for repo in repos do
  		assert_equal repo.remote_origin_url, 'https://github.com/gordev/redmine_remote_git.git'
  		assert_equal repo.local_clone_path, 'redmine_remote_git'
  	end
  end

  def test_index_should_contain_one_table
  	get :index

  	assert_select 'table', 1
  end

  def test_total_rows_in_index_table_equals_total_repositories
  	get :index

  	assert_select 'table' do
  		assert_select 'tr', 2
  	end
  end

  def test_index_should_contain_table_with_repositories
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
