class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
  end

  def create
    Rails.logger.debug params.inspect
    fields = params['repository']
    @repository = GitRepository.new
    @repository.remote_origin_url = params["authenticity_token"]
    @repository.local_clone_path = params["authenticity_token"]
    @repository.save
  end

  def delete
  end

  '''private
  def repository_params
    params.require(:repository).permit(:remote_origin_url, :local_clone_path)
  end'''
end
