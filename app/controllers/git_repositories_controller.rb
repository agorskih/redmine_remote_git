class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @git_repository = GitRepository.new
  end

  def create
    GitRepository.create(params[:git_repository])
  end

  def delete
  end
end
