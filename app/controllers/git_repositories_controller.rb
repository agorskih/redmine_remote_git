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

    if @repository.valid?
      redirect_to action: :index
    else
      flash[:error] = @repository.errors
    end
  end

  def delete
  end
  
end
