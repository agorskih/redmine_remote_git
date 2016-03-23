class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
    @repository.errors.clear
  end

  def create
    @repository = GitRepository.create(params[:git_repository])

    if @repository.valid?
      redirect_to action: :index
    end
  end

  def delete
  end
  
end
