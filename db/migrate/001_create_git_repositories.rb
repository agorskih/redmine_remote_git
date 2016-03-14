class CreateGitRepositories < ActiveRecord::Migration
  def change
    create_table :git_repositories do |t|
      t.string :remote_origin_url
      t.string :local_clone_path
    end
  end
end
