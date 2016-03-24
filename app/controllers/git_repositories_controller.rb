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
      flash[:error] = @repository.errors.full_messages.first
    end
  end

  def destroy
    GitRepository.find(params[:id]).destroy
    @repositories = GitRepository.all

    flash[:notice] = ['Repository was successfully deleted']
    render :index
  end

end
