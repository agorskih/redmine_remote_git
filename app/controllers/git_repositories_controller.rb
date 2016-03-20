class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
  end

  def create
    @repository = GitRepository.create(repository_params)
  end

  def delete
  end

  private
  def repository_params
    params.require(:git_repository).permit(:remote_origin_url, :local_clone_path)
  end
end
