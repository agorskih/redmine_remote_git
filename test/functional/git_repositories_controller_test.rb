unless ENV['TRAVIS'].nil? 
	require File.expand_path('../../test_helper', __FILE__)
end

class GitRepositoriesControllerTest < ActionController::TestCase
  def test_index
    get :index

    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:repositories)
  end
end
