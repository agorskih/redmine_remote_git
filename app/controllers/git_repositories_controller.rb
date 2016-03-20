class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
  end

  def create
    GitRepository.create(params[:repository])
  end

  def delete
  end
end
