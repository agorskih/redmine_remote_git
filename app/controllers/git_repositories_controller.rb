class GitRepositoriesController < ApplicationController
  unloadable


  def index
  	@repositories = GitRepository.all
  end

  def new
    @repository = GitRepository.new
  end

  def create
    fields = params[:repository]
    @repository = GitRepository.new
    @repository.remote_origin_url = fields[:repository_remote_origin_url]
    #@repository.local_clone_path = fields['repository_local_clone_path']
    #@repository.save
  end

  def delete
  end

  '''private
  def repository_params
    params.require(:repository).permit(:remote_origin_url, :local_clone_path)
  end'''
end
