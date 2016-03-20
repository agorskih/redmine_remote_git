class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
  end

  def create
    @repository = GitRepository.create(params[:git_repository])
  end

  def delete
  end
  
end
