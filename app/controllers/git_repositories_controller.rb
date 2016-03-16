class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def create
  end

  def delete
  end
end
